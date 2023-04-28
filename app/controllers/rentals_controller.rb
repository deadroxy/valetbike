class RentalsController < ApplicationController
  before_action :require_user_log_in!
    def new
    end
  
    def create
      @rental = Rental.new(rental_params)
      @price = @rental.hours
      if @rental.save
        session[:payment_id] = @rental.id
        redirect_to payment_path, notice: "Plase select your payment mehtod!"
      else
        render :new
      end
    end
 
  
    private
  
    def rental_params
      params.permit(:hours)
    end
  end
  
