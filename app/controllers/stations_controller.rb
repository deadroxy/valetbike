class StationsController < ApplicationController
  
  # def index
  #   @stations = Station.all.order(identifier: :asc)
  # end
  
  def index
    @stations = Station.order(params[:sort])
  end

  def test
    @test_num = 78
  end

end
