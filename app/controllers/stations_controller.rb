class StationsController < ApplicationController
  
  def index
    @stations = Station.all.order(identifier: :asc) #copied to home_controller
    @bikes = Bike.all.order(identifier: :asc) #data of bikes available to page - will be copied to home_controller
  end
  
end
