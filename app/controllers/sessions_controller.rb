class SessionsController < ApplicationController
   skip_before_action :authorized, only: [:new, :create, :welcome]

   def new
   end

   def create
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
         session[:user_id] = @user.id
         redirect_to '/welcome'
      else
         flash.alert = "Incorrect username or password"
      end
   end

   def destory
      session.clear
      redirect_to 'welcome'
   end

   def login
   end

   def welcome
   end

   def page_requires_login
   end
end
