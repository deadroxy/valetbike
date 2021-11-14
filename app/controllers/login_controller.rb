class LoginController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(Email: params[:email].downcase) || @user = User.find_by(Username: params[:email].downcase)
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

end
