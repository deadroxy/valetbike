class UserController < ApplicationController
  def profile
    @user = current_user
    @rentalHistory = @user.renting.completed
    
    @inProgressRenting = @user.renting.incompleted.first


  end
end
