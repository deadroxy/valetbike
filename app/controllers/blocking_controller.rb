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
                redirect_to user_home_path, notice: "Add to block"
            else
                redirect_to edit_blocking_path, notice: "Did not find the email"
            end
        else
            render :edit
        end
    end

end