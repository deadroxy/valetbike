class PagesController < ApplicationController
    def home
      if session[:email]
        @user = User.find(session[:email])
      end
    end
  end