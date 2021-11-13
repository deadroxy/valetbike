class BikesController < ApplicationController
  def index
  end

  def show
    @bikes = Bike.order('id ASC')
    @stations = Station.order('id ASC')
    
    
  end
end
