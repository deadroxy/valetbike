class HomeController < ApplicationController
  def index
    @bikes = Bike.all
  end
end
