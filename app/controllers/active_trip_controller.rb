class ActiveTripController < ApplicationController
  def index
  end

  def base_map
    if params[:station].present?
      @stations = Station.near(params[:station])
    else
      @stations = Station.all.order(identifier: :asc)
    end
  end

  def rent_map
    if params[:station].present?
      @stations = Station.near(params[:station])
    else
      @stations = Station.all.order(identifier: :asc)
    end
  end

  def return_map
    if params[:station].present?
      @stations = Station.near(params[:station])
    else
      @stations = Station.all.order(identifier: :asc)
    end
    
  def return
    end
  end

  def testing
    if params[:station].present?
      @stations = Station.near(params[:station])
    else
      @stations = Station.all.order(identifier: :asc)
    end
  end
end
