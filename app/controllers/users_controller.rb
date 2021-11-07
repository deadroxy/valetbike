class UsersController < ApplicationController
  def new
<<<<<<< HEAD
  end

  def create
=======
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:username,
   :password))
   session[:user_id] = @user.id
   redirect_to '/welcome'
>>>>>>> temp-branch
  end
end
