class RidesController < ApplicationController
  def index
    @rides = Ride.all.order(id: :asc)
  end
end
