class PasswordResetsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user.present?
            puts "User found #{@user}"
            flash[:info]="User found"
            PasswordMailer.with(user: @user).reset.deliver_now
        else
            puts "No user"
            flash[:danger]="No user found"
        end            
        redirect_to password_reset_edit_url(token:@token)
    end

    def edit
        @user = User.find_signed(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        flash[:danger]="Your token has expired. Please try again"
        redirect_to login_path
    end

    def update
        @user = User.find_signed(params[:token], purpose: "password_reset")
        if @user.update(password_params)
            flash[:success]= "Your password was reset successfully. Please sign in"
            redirect_to login_path
        end
    end

    private

    def password_params
        params.require(:user).permit(:password)
    end

end