class SessionsController < ApplicationController

  def new
    #render a form where user can log in
  end

  def create
    #take params from new and logs the user in
    @user = User.find_by(email: params[:email])
    if !!@user && @user.authenticate(params[:password])
      #log that person in
      flash[:notice] = "Logged in successfully."
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    #log user outs
    session[:user_id] = nil
    redirect_to root_path
  end


end
