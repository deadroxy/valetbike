class SessionsController < ApplicationController
   before_action :authorized, only: [:destroy, :login, :page_requires_login, :show]

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

   def destroy
      # session.delete(:user_id)
      session.clear()
      #print("here")
      # session.clear
      #render 'layouts/sidebar'
      redirect_to '/index'
   end

   def login
   end

   def welcome
   end

   def page_requires_login
   end
   
   def show
   end
end
