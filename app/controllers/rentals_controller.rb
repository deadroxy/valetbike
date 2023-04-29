class RentalsController < ApplicationController
  before_action :require_user_log_in!
    def new
      @bike= Bike.find_by_identifier(params[:format])
    end
  
    def create
      @rental = Rental.new(rental_params)
      @price = @rental.hours
      if @rental.save
        @bike= Bike.find_by_identifier(params[:format])
        $s= @bike.current_station_id
        session[:payment_id] = @rental.id
        redirect_to payment_path(params[:format]), notice: "Plase select your payment mehtod!"
      else
        render :new
      end
    end

    def return
      @bikes= Bike.find_by_identifier(params[:format])
      @bikes.update({current_station_id: $s })
      redirect_to '/bikes/return'
    end
  
    private
  
    def rental_params
      params.permit(:hours)
    end
  end
  
