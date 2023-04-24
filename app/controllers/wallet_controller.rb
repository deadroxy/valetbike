class WalletController < ApplicationController
    before_action :require_user_log_in!

    def edit
    end

    def update

        if params[:coupon] == "CYBER"
            Current.user.wallet_point+=100
            Current.user.save
            redirect_to user_home_path, notice: "Add Point"
        else
            flash.alert = "Coupon not correct"
            redirect_to change_wallet_path
        end
    end

    private

end