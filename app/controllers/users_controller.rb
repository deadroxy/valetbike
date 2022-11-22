class UsersController < ApplicationController
  #  before_action :logged_in_user, only: [:edit, :update]
  # before_action :correct_user,   only: [:edit, :update]
  def index
    @users = User.all.order(identifier: :asc)
  end

  def show
    @user = User.find(params[:id])
  end
 

  def new
    @user = User.new
  end

  
  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_path
    else
      render :new
    end
  end

  # The update action (re-)fetches the user from the database,
  #  and attempts to update it with the submitted form data 
  # filtered by info.

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render ('edit')
    end
  end

  def destroy
    @user = User.find(params[:username])
    @user.destroy
    redirect_to root_path
  end

  def delete
    @user = User.find(param[:id])
  end
    
  private
  
  def user_params
    params.require(:user).
    permit(:first_name, :last_name, :username, :email, :password, :password_confirmation);
    
  end


end
