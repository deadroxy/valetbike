class BikesController < ApplicationController
  
  def index
    @bikes = Bike.all.order(id: :asc)
  end

end
