class PaymentController < ApplicationController
    before_action :require_user_log_in!
    # initiate payment
     # confirm payment

    def edit
        if session[:user_id]
            @user = User.find(session[:user_id])
        end
        if session[:payment_id]
            @rental = Rental.find(session[:payment_id])
        end
    end


    def update
        if session[:payment_id]
            @rental = Rental.find(session[:payment_id])
        end
        if params[:yn_wallet] == "y" || params[:yn_wallet] == "Y"  || params[:yn_wallet] == "Yes" ||params[:yn_wallet] == "yes"
            @price = @rental.hours
            if @price > Current.user.wallet_point
                redirect_to change_wallet_path, notice:"Not enough money point in your Wallet"
            else
                Current.user.wallet_point-=@price
                Current.user.save
                redirect_to bikes_unlock_path, notice: "Bike rented successfully!"
            end  
        elsif params[:finamecard] == "Bikesia" && params[:lanamecard] =="Team" && params[:card_num] == "1111111111" && params[:card_date] == "2023-02-01" && params[:cvv] == "111"
            redirect_to bikes_unlock_path, notice: "Payment through Credit Card succeeds"
        elsif params[:email_paypal] =="test@smith.edu" && params[:password_paypal] =="password"
            redirect_to bikes_unlock_path, notice: "Payment through Paypal succeeds"
        elsif params[:coupon_number] == "CYBER" && params[:coupon_sc] =="2023"
            redirect_to bikes_unlock_path, notice: "Payment through Coupon succeeds"
        else
            redirect_to payment_path, notice: "Payment not succeeds"
        end
     end

        



end
