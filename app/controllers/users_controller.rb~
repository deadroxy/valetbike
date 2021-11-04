class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save!
      render 'index'
    else
      render :action => 'new' 
    end
  end


  private

    def user_params
      params.permit(:Email, :Username, :Password, :CreditCardNum, :ExpDate, :SecurityCode)
    end
end
