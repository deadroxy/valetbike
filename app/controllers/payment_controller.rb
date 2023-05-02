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
        @bike= Bike.find_by_identifier(params[:format])
        if session[:payment_id]
            @rental = Rental.find(session[:payment_id])
        end
        if params[:yn_wallet] == "y" || params[:yn_wallet] == "Y"  || params[:yn_wallet] == "Yes" ||params[:yn_wallet] == "yes"
            @price = @rental.hours
            if @price > Current.user.wallet_point
                flash[:success]="Not enough money point in your Wallet"
                redirect_to change_wallet_path
            else
                @bike.update({current_station_id: nil })
                Current.user.wallet_point-=@price
                Current.user.save
                flash[:success]="Payment through wallet succeeds!"
                redirect_to bikes_unlock_path(params[:format])
            end  
        elsif params[:finamecard] == "Bikesia" && params[:lanamecard] =="Team" && params[:card_num] == "1111111111" && params[:card_date] == "2025-02-01" && params[:cvv] == "111"
            flash[:success]="Payment through Credit Card succeeds"
            redirect_to bikes_unlock_path(params[:format])
        elsif params[:email_paypal] =="test@smith.edu" && params[:password_paypal] =="password"
            flash[:success]="Payment through Paypal succeeds"
            redirect_to bikes_unlock_path(params[:format])
        elsif params[:coupon_number] == "CYBER" && params[:coupon_sc] =="2023"
            flash[:success]="Payment through Coupon succeeds"
            redirect_to bikes_unlock_path(params[:format])
        else
            flash[:success]="Payment not succeeds"
            redirect_to payment_path
        end
     end

        



end
