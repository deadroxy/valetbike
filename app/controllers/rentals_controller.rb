class RentalsController < ApplicationController
    def new
    end
  
    def create
      @rental = Rental.new(rental_params)
      puts @rental
      if @rental.save
        redirect_to ('/bikes/unlock'), notice: "Bike rented successfully!"
      else
        render :new
      end
    end
 
  
    private
  
    def rental_params
      params.permit(:hours)
    end
  end
  
