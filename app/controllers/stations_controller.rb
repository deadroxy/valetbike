class StationsController < ApplicationController
  
  def index
    if params[:search]
      @stations = Station.search(params[:search]).order(identifier: :asc).paginate(page: params[:page], per_page: 4)
    else
      @stations = Station.all.order(identifier: :asc).paginate(page: params[:page], per_page: 4)
    end


  end

  def new 
    @station = Station.new(station_params)
    
  end

  def create 
    @station = Station.new(station_params)
    if @station.save
      redirect_to locations_path
    end
  end

  def search
    if params[:search]
      @stations = Station.search(params[:search]).order(identifier: :asc).paginate(page: params[:page], per_page: 4)
    else
      @stations = Station.all.order(identifier: :asc).paginate(page: params[:page], per_page: 4)
    end

    render ('index')
  end


  private

  def station_params
    params.require(:station).permit(
      :identifier,
      :name, 
      :address,)
  end

end
