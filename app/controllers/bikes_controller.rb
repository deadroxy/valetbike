class StationsController < ApplicationController
  
  def index
    #asc makes it ascending and desc makes it descending
    @bikes = Bike.all.order(identifier: :desc)
  end
  
end
