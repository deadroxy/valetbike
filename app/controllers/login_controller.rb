class LoginController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    #@user = User.new(user_params)
    @user = User.find_by(Email: params[:email].downcase)
    if @user && (@user.password == params[:psw])
    #if @user && @user.authenticate(params[:psw])
      log_in @user
      redirect_to root_path
    else
      render :action => 'index'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end


  #private

  #def user_params
      #params.permit(:Email, :Username, :Password, :CreditCardNum, :ExpDate, :SecurityCode)
    #end
end
