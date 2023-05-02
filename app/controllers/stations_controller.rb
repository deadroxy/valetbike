class StationsController < ApplicationController
  
  def index
    @stations = Station.all.order(identifier: :asc)
  end
  
  def show
    @station = Station.find(params[:identifier])
  end
  
  #@stations = Station.find_by(identifier: params[:identifier])

  def map #map to be displayed
    # @stations = Station.all.order(identifier: :asc) #makes the stations appear on the page
  end
  
  def return
  end

  def location #use params for this url to have each rental stations
  end



end
