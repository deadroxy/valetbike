class RentalController < ApplicationController
  
  def index
    @stations = Station.order(name: :asc).select{|s| s.docked_bikes.count != 0}  # All stations with at least one bike, ordered alphabetically by name 
    @maxBikesHash = {} # Key = station name, Value = number of bikes at station
    @stations.each do |s|
      @maxBikesHash[s.name] = s.docked_bikes.count
    end
    @maxBikesHash = @maxBikesHash.to_json; # Converts to JSON for use in JavaScript
  end

  def unlocked # Called when user clicks unlock from rental page
    @stations = Station.order(name: :asc).select{|s| s.docked_bikes.count != 0}  # All stations with at least one bike, ordered alphabetically by name 
    
    @stationName = params[:stationName] # Gets current station from params, posted by rental page
    @numBikes = params[:numBikes].to_i # Gets number of bikes from parems, posted by rental page
    
    @stationNum = @stations.find{|s| s.name == @stationName}.identifier.to_i # Gets current station by name, to modify number of bikes
    @bikeNums = Array(@numBikes)
    i = 0
    while i < @numBikes do
      bike = Bike.find{|b| b.current_station_id == @stationNum} # Find bike at current station
      @bikeNums[i] = bike.identifier # Get bike id for user
      bike.update({'current_station_id': 0}) # Remove bike from station
      i += 1
    end
  end
  
end
