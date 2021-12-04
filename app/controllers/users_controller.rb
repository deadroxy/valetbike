class UsersController < ApplicationController
  
  def index
    if logged_in?
      @bikes = Bike.order(checkoutTime: :asc).select{|b| b.current_user_id == current_user.id} # Bikes of current user
    else # Handle error case where user isn't logged in
      flash[:error] = "You must be logged in to view profile"
      redirect_to controller: :login, action: :index
    end
  
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to root_path
    else
      flash.now[:alert] ||= ""
      @user.errors.full_messages.each do |message|
        flash.now[:alert] << "Error: " + message + ". "
      end
      render :action => 'new'
    end
  end


  private

    def user_params
      params.require(:user).permit(:email, :username, :password, :creditCardNum, :expDate, :securityCode)
    end
end
