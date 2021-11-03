class StationsController < ApplicationController
  
  def index
    @stations = Station.all.order(id: :asc)
  end

end
