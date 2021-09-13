class StationsController < ApplicationController
  
  def index
    @stationsasc = Station.all.order(identifier: :asc)
    @bikesasc = Bike.all.order(identifier: :asc)
    @stationsdsc = Station.all.order(identifier: :desc)
    @bikesdsc = Bike.all.order(identifier: :desc)
  end
  
end
