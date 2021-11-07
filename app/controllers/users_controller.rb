# Purpose: This controller handles the app's users

class UsersController < ApplicationController
    def new
    end

    def create
        # Creates a new user based on the parameters given in the form
        @user = User.create(
            firstName: params[:firstName], 
            lastName: params[:lastName],
            email: params[:email],
            userName: params[:userName],
            password: params[:password])

        # When a user successfully creates an account, redirect them to their profile.
        redirect_to @user
    end

    def show
        @user = User.find(params[:id])
    end

end