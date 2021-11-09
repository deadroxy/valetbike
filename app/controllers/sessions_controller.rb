class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])

        # line 14 (right under this comment) was in the original article but giving me an error message

        # sessions[:user_id] = @user.id

        # the error was that i hadn't created/defined a local variable/method named sessions, which is true, but it also
        # offered the suggestion to change it to 'session' which i did (see below), but i don't know if
        # this messes up anything ;-;

        session[:user_id] = @user.id

        redirect_to '/welcome'
    else
        redirect_to '/login'
    end

  end

  def login
  end

  def welcome
  end

  def page_requires_login
  end


end
