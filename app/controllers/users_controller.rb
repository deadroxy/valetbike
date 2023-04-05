class UsersController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]
  
  def new
    @user = User.new
    puts @user 
  end

  def create
    @user = User.create(params.require(:user).permit(:username, :password, :email, :address, :date_birth, :phone_number))
    session[:user_id] = @user.id
    redirect_to '/welcome'
  end
end



