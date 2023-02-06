class StationsController < ApplicationController
  
  def index
    @stations = Station.all.order(identifier: :desc)
  end
  
end
