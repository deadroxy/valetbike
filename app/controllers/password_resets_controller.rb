class PasswordResetsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(email: params[:email])

        if @user.present?
            # send to email
            puts "User found #{@user}"
            flash[:notice] = "User found"
            PasswordMailer.with(user: @user).reset.deliver_now
        else
            puts "No user"
            flash[:alert] = "No user"
        end
            
        redirect_to root_path, notice: "if an email is found, we will send an reset link to your email"
    end

    def edit
        @user = User.find_signed(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to login_path, alert: "Your token has expired. Please try again"
    end

    def update
        @user = User.find_signed(params[:token], purpose: "password_reset")
        if @user.update(password_params)
            redirect_to login_path, notice: "Your password was reset successfully. Please sign in"
        end
    end

    private

    def password_params
        params.require(:user).permit(:password)
    end

end