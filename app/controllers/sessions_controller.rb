class SessionsController < ApplicationController

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        sta = Station.find_by(identifier: params[:session][:identifier])

        if user && user.authenticate(params[:session][:password])
          session[:user_id] = user.id
          session[:username] = user.username
          #cookies[:username] = params[:username]
          #flash[:notice] = "Logged in successfully."
          flash[:success] = "Logged in successfully."
          redirect_to root_path
        else
          flash.now[:alert] = "There was something wrong with your login details."
          render 'new'
        end
      end
       
      def destroy
        session[:user_id] = nil
        #flash[:notice] = "You have been logged out."
        flash[:success] = "You have been logged out."
        redirect_to root_path
      end

end
