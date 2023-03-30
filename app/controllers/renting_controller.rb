class RentingController < ApplicationController
  def index

  end

  def new
    @renting = Renting.new(:status)
  end

  def create
    @renting = Renting.new()
    if renting_process.save
      @rentCode = @renting.rentCode
      @returnCode = @renting.returnCode
      redirect_to(action:show)
    end
  
  end

  def show
    @station = renting_process.find(params[:current_station_id])

  end

  private
    def renting_params
      params.require(:task).permit(
        :completed,
        :description
      )
    end


end
