class MapController < ApplicationController
  def index
      @stations = Station.all.order(id: :asc)
  end

  def show
    @station = Station.find_by_id(params[:id])
  end
  
end
