class HomeController < ApplicationController
  def Map
      @stations = Station.all.order(id: :asc)
  end

  def Rides
  end

  def Pricing
  end

  def Signup
  end

  def Login
  end
  
end
