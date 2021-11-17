class MapController < ApplicationController
  def index
      @stations = Station.all.order(id: :asc)
  end
  
end
