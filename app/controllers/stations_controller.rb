class StationsController < ApplicationController
  
  def index
    @stations = Station.all.order(identifier: :asc)
  end

  def show
    @station = Station.find(params[:id])
    @curr_bikes = Bike.where(current_station_id: @station.id, avail: true)
  end

  def return 
    @curr_bike = Bike.find_by(identifier: current_user.active_bike)
    @curr_rental = Rental.find_by(end_time: nil)
    @curr_station = Station.find(params[:id])
    
    @curr_bike.avail = true
    @curr_bike.current_station_id = @curr_station.id
    @curr_bike.save 
    @curr_station.save

    current_user.active_bike = nil 
    current_user.save

    @curr_rental.end_time = Time.zone.now
    @curr_rental.save 

  end
  
end
