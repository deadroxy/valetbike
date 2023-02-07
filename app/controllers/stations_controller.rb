class StationsController < ApplicationController
  
  def index
    if params[:order] == "desc"
      @stations = Station.all.order(identifier: :desc)
    else 
      @stations = Station.all.order(identifier: :asc)
    end
    
  end
  
end
