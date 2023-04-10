class UsersController < ApplicationController

  before_action :authorized, only: [:profile, :show]
  
  def new
    @user = User.new
    puts @user 
  end

  def create
    @user = User.create(params.require(:user).permit(:username, :password, :email, :address, :date_birth, :phone_number))
    session[:user_id] = @user.id
    redirect_to '/welcome'
  end
  def profile
  end
  def show
  end
end



