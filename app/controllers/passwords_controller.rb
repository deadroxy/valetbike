class PasswordsController < ApplicationController
    before_action :require_user_log_in!

    def edit
    end

    def update
        if Current.user.update(password_params)
            redirect_to user_home_path, notice: "Password Changed"
        else
            render :edit
        end
    end

    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end

end