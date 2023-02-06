class BikesController < ApplicationController
  
    # def index
    #   @bikes = Bike.all.order(identifier: :asc)
    # end

    def index
      @bikes = Bike.order(params[:sort])
    end
     
end
  