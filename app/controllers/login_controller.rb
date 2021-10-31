class LoginController < ApplicationController
  def index
  end


  def create
    @user = User.new(user_params)
    if @user.save
      render 'index'
    else
      render 'signup' 
    end
  end

  
  def signup
  end

  private

    def user_params
      params.permit(:Email, :Username, :Password, :CreditCardNum, :ExpDate, :SecurityCode)
    end
end 
