class StationsController < ApplicationController
  
  def index
    @stations = Station.all.order(identifier: :asc)
  end
  
  def reverse
    @stations = Station.all.order(identifier: :desc)
  end
  
end
