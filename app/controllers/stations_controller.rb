class StationsController < ApplicationController
  
  def index
    @stations = Station.all.order(identifier: :asc)
  end
  def login
    # render the login page
  end
end
