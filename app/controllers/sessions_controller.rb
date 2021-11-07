# Purpose: Handles the user's sessions.

class SessionsController < ApplicationController
    def new
    end

    # When a user logs in, it creates a new session for that specific user.
    def create
        @user = User.find_by(userName: params[:userName])

        #If the userName is valid and the password is valid
        if @user && @user.authenticate(params[:password])
            # Log the user in
            session[:id] = @user.id
            redirect_to @user
        else
            render 'new'
        end
    end

    # When a user logs out, we delete their active session.
    def destroy
        session.delete(:id)
        redirect_to root_url
    end
end