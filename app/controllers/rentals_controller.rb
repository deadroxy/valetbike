class RentalsController < ApplicationController
    def new
        @rental = Rental.new
        #@current_time = Time.now 
       
    end
    
    def create
        @rental = Rental.create(params.require(:user_id).permit(:user_id, :bike_id, :start_time, :start_station_id,))
        redirect_to '/welcome'
    #redirect_to '/welcome'
        #instantate using
        #current user
        #bike we just redierected from 
         


    end

end
