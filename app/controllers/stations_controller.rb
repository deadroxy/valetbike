class StationsController < ApplicationController
  
  def index
    # @stations = Station.all.order(identifier: :asc)
    @stations = [{identifier: "wuieiu", name: "Atkins Farms Country Market", address: "Amherst, Massachusetts"}, {identifier: "edyhjds", name: "Atkins Farms Country Market", address: "South Amherst, Massachusetts"}, {identifier: "ewieio", name: "Atkins Farms Country Market", address: "Northampton, Massachusetts"}]
    @stations.each do |station| 
      puts station[:identifier]
      puts station[:name]
      puts station[:address]
    end

  end

end
