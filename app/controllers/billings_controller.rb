class BillingsController < ApplicationController
    def index
    end

    def create
        @billing= Billing.new(billing_params)
        if @billing.save
            render :show
        else 
            render json: @billing.errors.full_messages, status:422
        end

    end

    def create_mastercard
        @billing= Billing.new(billing_params.merge(payment_method: "mastercard", user_id: current_user.id))
        if @billing.save
            current_user.credits += params[:credits].to_i
            current_user.save
            render :show
        else 
            render json: @billing.errors.full_messages, status:422
        end
    end

    def create_VISA
        @billing= Billing.new(billing_params.merge(payment_method: "VISA", user_id: current_user.id))
        if @billing.save
            current_user.credits += params[:credits].to_i
            current_user.save
            render :show
        else 
            render json: @billing.errors.full_messages, status:422
        end
    end
        
            
    def show
        @billing= Billing.find(params[:id])
    end

    def update
    end

    def destroy
    end
    private

    def billing_params
        params.permit( :payment_method, :holder_name, :card_number, :expir_date, :cvv, :user_id )
    end
end
