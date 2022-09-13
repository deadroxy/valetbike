require 'csv'

class StationsController < ApplicationController
  
  def index
    @stations = Station.all.order(identifier: :asc)
  end

  def show
    @stations = Station.all.order(identifier: :asc)
  end
  
  def bikes
    #TODO: create bike list and bike page (bikes.html.erb)
  end

end
