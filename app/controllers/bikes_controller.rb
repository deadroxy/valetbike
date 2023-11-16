class BikesController < ApplicationController
    def index
        @bikes = Bike.all.order(identifier: :asc)
    end

    def show
        @bike = Bike.find(params[:id])
    rescue ActiveRecord::RecordNotfound
      redirect_to root_path
    end
end
