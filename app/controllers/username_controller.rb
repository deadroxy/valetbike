class UsernameController < ApplicationController
    before_action :require_user_log_in!

    def edit
    end

    def update
        if Current.user.update(username_params)
            redirect_to user_home_path, notice: "Username"
        else
            render :edit
        end
    end

    private

    def username_params
        params.require(:user).permit(:username)
    end

end