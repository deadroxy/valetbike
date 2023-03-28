class StationsController < ApplicationController
  
  def index
    @stations = Station.all.order(identifier: :asc)
    @bikes = Bike.all.order(identifier: :asc)
  end
  def new
    @station = Station.new
  end

  def create
    @station = Station.new(station_params)
    
    if @station.save
      redirect_to(stations_path)
    else
      render('new')
    end
  end

  def edit
    @station = station.find(params[:id])
  end

  def update
    @station = station.find(params[:id])
    if @station.update(station_params)
      redirect_to(stations_path)
    else
      render('edit')
    end
  end

  def delete
    @station = station.find(params[:id])
  end

  def destroy
    @station = station.find(params[:id])
    @station.destroy
    redirect_to(stations_path)
  end
  private
  
  def station_params
    params.require(:station).permit(:name)
  end
end
