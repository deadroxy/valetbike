class StationsController < ApplicationController
  
  def index
    @stations = Station.all.order(identifier: :asc)
    @bikes = Bike.all.order(identifier: :asc)
    if params[:view]
      @view = params[:view]      
    else
      @view = "stations"
    end
  end
end
