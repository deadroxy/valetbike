class BlockingController < ApplicationController
    before_action :require_user_log_in!

    def edit
    end

    def update
        if Current.user.admin == true
            if @blockinguser = User.find_by(email: params[:email]) != nil
                @blocking_user = User.find_by(email: params[:email])
                @blocking_user.update(block: !@blocking_user.block)
                @blocking_user.save
                flash[:success]= "User blocked sucessfully"
                redirect_to user_home_path
            else
                flash[:danger]= "User doesn't exist. Email not found"
                redirect_to edit_blocking_path
            end
        else
            render :edit
        end
    end

end