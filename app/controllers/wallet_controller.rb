class WalletController < ApplicationController
    before_action :require_user_log_in!

    def edit
    end

    def update

        if params[:finamecard] == "Bikesia" && params[:lanamecard] =="Team" && params[:card_num] == "1111111111" && params[:card_date] == "2025-02-01" && params[:cvv] == "111"
            Current.user.wallet_point+=params[:wallet_add_card].to_i
            Current.user.save
            flash[:success] = "Money ddded through credit card"
            redirect_to user_home_path
        elsif params[:email_paypal] =="test@smith.edu" && params[:password_paypal] =="password"
            Current.user.wallet_point+=params[:wallet_add_paypal].to_i
            puts params[:wallet_add_paypal].to_i
            Current.user.save
            flash[:success] = "Money Added through paypal"
            redirect_to user_home_path
        elsif params[:coupon_number] == "CYBER" && params[:coupon_sc] =="2023"
            Current.user.wallet_point+=10
            Current.user.save
            flash[:success] = "Money added through coupon"
            redirect_to user_home_path
        else
            flash[:danger] = "Something is wrong Please try again"
            redirect_to change_wallet_path
        end
    end
    private

end