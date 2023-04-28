class StationsController < ApplicationController

  def new
    @station =Station.new
  end

  def create
    @station = Station.new(sta_params)
    if @station.save
        flash[:notice] = "Station added."
        redirect_to stations_path
    else
        render 'new'
    end
  end
  
  def main
    @stations = Station.all.order(identifier: :asc)
  end
  
  def reverse
    @stations = Station.all.order(identifier: :desc)
  end

  def show
    @station = Station.find_by_identifier(params[:id])
    puts @station 
  end
  
  private

  def sta_params
    params.require(:station).permit(:identifier, :name, :address)
  end

end
