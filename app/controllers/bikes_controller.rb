class BikesController < ApplicationController
    def index
        @bikes = Bike.where(current_station_id: @station.id)
    
    end

    def show
        @bike = Bike.find(params[:id])
    rescue ActiveRecord::RecordNotfound
      redirect_to root_path
    end
end
