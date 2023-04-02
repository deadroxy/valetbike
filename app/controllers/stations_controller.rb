class StationsController < ApplicationController
  
  def main
    @stations = Station.all.order(identifier: :asc)
  end
  
  def reverse
    @stations = Station.all.order(identifier: :desc)
  end
  
end
