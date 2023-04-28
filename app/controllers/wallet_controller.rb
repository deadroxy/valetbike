class WalletController < ApplicationController
    before_action :require_user_log_in!

    def edit
    end

    def update

        if params[:finamecard] == "Bikesia" && params[:lanamecard] =="Team" && params[:card_num] == "1111111111" && params[:card_date] == "2023-02-01" && params[:cvv] == "111"
            Current.user.wallet_point+=params[:wallet_add_card]
            Current.user.save
            redirect_to user_home_path, notice: "Added through credit card"
        elsif params[:email_paypal] =="test@smith.edu" && params[:password_paypal] =="password"
            Current.user.wallet_point+=params[:wallet_add_card]
            Current.user.save
            redirect_to user_home_path, notice: "Added through paypal"
        elsif params[:coupon_number] == "CYBER" && params[:coupon_sc] =="2023"
            Current.user.wallet_point+=10
            Current.user.save
            redirect_to user_home_path, notice: "Added through coupon"
        else
            flash.alert = "Something no correct Please try again"
            redirect_to change_wallet_path
        end
    end

    private

end