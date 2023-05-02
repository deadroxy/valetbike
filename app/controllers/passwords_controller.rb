class PasswordsController < ApplicationController
    before_action :require_user_log_in!

    def edit
    end

    def update
        if Current.user.update(password_params)
            flash[:success]= "Password Changed"
            redirect_to user_home_path
        else
            render :edit
        end
    end

    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end

end