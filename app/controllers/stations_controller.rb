class StationsController < ApplicationController
  
  def index
    @stations = Station.all.order(identifier: :asc)
    
    if params[:search_by_address] && params[:search_by_address] != ""
      @stations = @stations.where("address LIKE ?", "%#{params[:search_by_address]}%")
    end
    puts @stations
  end
  
end
