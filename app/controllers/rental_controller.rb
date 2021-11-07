class RentalController < ApplicationController
  
  def rent
    @stations = Station.order(name: :asc).select{|s| s.docked_bikes.count != 0}  # All stations with at least one bike, ordered alphabetically by name 
    @maxBikesHash = {} # Key = station name, Value = number of bikes at station
    @stations.each do |s|
      @maxBikesHash[s.name] = s.docked_bikes.count
    end
    @maxBikesHash = @maxBikesHash.to_json; # Converts to JSON for use in JavaScript
  end

  def return
    @stations = Station.order(name: :asc)  # All stations, ordered alphabetically by name 
    @bikes = Bike.order(id: :asc).select{|b| b.current_user_id == 1} # Bikes of current user
  end

  def unlock # Called when user clicks unlock from rental page
    @stations = Station.order(name: :asc).select{|s| s.docked_bikes.count != 0}  # All stations with at least one bike, ordered alphabetically by name 
    
    @stationName = params[:stationName] # Gets current station from params, posted by rental page
    @numBikes = params[:numBikes].to_i # Gets number of bikes from parems, posted by rental page
    
    @stationNum = @stations.find{|s| s.name == @stationName}.id.to_i # Gets current station by name, to modify number of bikes
    @bikeIds = Array(@numBikes)
    i = 0
    while i < @numBikes do
      bike = Bike.find{|b| b.current_station_id == @stationNum} # Find bike at current station
      @bikeIds[i] = bike.id # Get bike id for user
      bike.update({'current_station_id': nil}) # Remove bike from station
      bike.update({'current_user_id': 1}) # Assign bike to user
      bike.update({'checkoutTime': Time.now.inspect}) # Add checkout time
      bike.update({'checkinTime': nil}) # Remove checkin timw
      i += 1
    end
    redirect_to(action: 'confirmationRent', stationName: @stationName, numBikes: @numBikes) # Prevents form resubmission
  end

  def lock # Called when user clicks unlock from rental page
    @stations = Station.order(name: :asc) # All stations 
    @stationName = params[:stationName] # Gets current station from params, posted by rental page
    @bikeId = params[:bikeId].to_i # Gets bike id from params, posted by return page

    @stationNum = @stations.find{|s| s.name == @stationName}.id.to_i # Gets current station by name, to modify number of bikes
    
    bike = Bike.find(@bikeId) # Find bike with given id
    bike.update({'current_user_id': nil}) # Remove bike from current user
    bike.update({'current_station_id': @stationNum}) # Dock bike at station
    bike.update({'checkinTime': Time.now.inspect}) # Add checkin time
    redirect_to(action: 'confirmationReturn', stationName: @stationName, numBikes: @numBikes) # Prevents form resubmission
  end

  def confirmationRent 
    @stationName = params[:stationName] # Gets current station from params, posted by rental page
    @numBikes = params[:numBikes].to_i # Gets number of bikes from parems, posted by rental page
  end

  def confirmationReturn 
    @stationName = params[:stationName] # Gets current station from params, posted by rental page
  end
end
