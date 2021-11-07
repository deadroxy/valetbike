# Purpose: This controller handles the bike stations

class StationsController < ApplicationController
  
  def index
    @stations = Station.all.order(identifier: :asc)
  end
  
end
