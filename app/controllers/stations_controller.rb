class StationsController < ApplicationController
  
  def main
    @stations = Station.all.order(identifier: :asc)
  end
  
end
