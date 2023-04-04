class StationsController < ApplicationController
  
  def main
    @stations = Station.all.order(identifier: :asc)
  end
  
  def reverse
    @stations = Station.all.order(identifier: :desc)
  end
  def show
    @station = Station.find_by_identifier(params[:id])
    puts @station
    
  end
  
end
