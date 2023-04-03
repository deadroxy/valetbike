class StationsController < ApplicationController
  
  def index
    @stations = Station.all.order(identifier: :asc)
    # @stations = [{identifier: "wuieiu", name: "Atkins Farms Country Market", address: "Amherst, Massachusetts"}, {identifier: "edyhjds", name: "Atkins Farms Country Market", address: "South Amherst, Massachusetts"}, {identifier: "ewieio", name: "Atkins Farms Country Market", address: "Northampton, Massachusetts"}]
    @stations = Station.search(params[:search])
    @stations.each do |station| 
      puts station[:identifier]
      puts station[:name]
      puts station[:address]
    end

  end

  def create 
    @station = Station.new(station_params)
    
  end


  private

  def station_params
    params.require(:station).permit(
      :name, 
      :street,
      :city,
      :state,
      :country,
      :zipcode,)
  end

end
