class UsersController < ApplicationController

  skip_before_action :require_login, only: [:create, :new]

  #keep login
  def show
    @user = User.find(params[:user_id])
    render :current_user
  end

  def index
  end

  # def new
  
  # end

  #Sign-up
  def create
    logger.info("\n\n*****attempting to create new user\n\n")
    logger.info("\n\n*****In new #{user_params}\n\n")
    @user = User.new(user_params)
    logger.info("\n\n*****Set new\n\n")
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      logger.info("\n\n*****ERRORRRRRRRRR\n\n")
      redirect_to sign_up_path
    end
  end

  private 
  
  def user_params
    logger.info("\n\n*****attempting to create new user\n\n")
    params.permit(:email_address, :password, :password_confirmation, :first_name, :last_name)
  end

end