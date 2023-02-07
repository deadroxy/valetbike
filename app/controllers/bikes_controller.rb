class BikesController < ApplicationController

  def index
    if params[:order] == "desc"
      @bikes = Bike.all.order(identifier: :desc)
    else 
      @bikes = Bike.all.order(identifier: :asc)
    end
  end
  
end
