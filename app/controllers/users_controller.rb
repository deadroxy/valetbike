class UsersController < ApplicationController
  def show
    if user_signed_in?
      @user = current_user
    else
      redirect_to(controller: 'sessions', action: 'new' )
    end
  end
end
