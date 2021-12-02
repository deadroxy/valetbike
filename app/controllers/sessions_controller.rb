class SessionsController < ApplicationController

    skip_before_action :authorized, only: [:new, :create, :destroy]

  def new
    #render a form where user can log in
  end

  def create
    #take params from new and logs the user in
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      #log that person in
      session[:id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    #log user outs
    session.delete(:id)
    redirect_to root_path
  end

  def payments
end

end
