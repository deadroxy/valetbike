class RentalsController < ApplicationController
  before_action :require_user_log_in!
    def new
      @bike= Bike.find_by_identifier(params[:format])
    end
  
    def create
      @rental = Rental.new(rental_params)
      @price = @rental.hours*10
      if @price > Current.user.wallet_point
        redirect_to change_wallet_path, notice:"Not enough money point in your Wallet"
      end

      puts @rental
      if @rental.save 
        @bikes= Bike.find_by_identifier(params[:format])
        $s= @bikes.current_station_id
        @bikes.update({current_station_id: nil })
        Current.user.wallet_point-=@price
        Current.user.save
        redirect_to (bikes_unlock_path(params[:format])), notice: "Bike rented successfully!"
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
  
