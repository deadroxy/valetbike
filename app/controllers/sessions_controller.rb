class SessionsController < ApplicationController

<<<<<<< HEAD


<<<<<<< HEAD
  skip_before_action :authorized, only: [:new, :create, :welcome, :checkout, :about, :payment, :checkin, :check, :process_checkin]
=======
  skip_before_action :authorized, only: [:new, :create, :welcome, :checkout, :about, :payment, :checkin, :check, :how_it_works, :FAQ]
>>>>>>> fa699f9e590c812a48ce83734065800da48f3d7c
  skip_before_action :authorized, only: [:new, :create, :welcome, :checkout, :about, :payment, :checkin, :check, :process_checkin, :how_it_works, :FAQ]


=======
  skip_before_action :authorized, only: [:new, :create, :welcome, :checkout, :about, :payment, :checkin, :check, :how_it_works, :FAQ, :process_checkin]
>>>>>>> 1106df016ed1a8b3a1c3041887d57aca832a3e1e


  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])

        session[:user_id] = @user.id

        redirect_to '/authorized'
    else
        redirect_to '/login'
    end

  end

  def login
  end

  def welcome
  end

  def about
  end

  def page_requires_login
    @stations = Station.all.order(identifier: :asc)
    @bikes = Bike.all.order(identifier: :asc)
  end

  def payment
  end

  def checkout
    if params[:station_identifier]
      p params[:station_identifier].to_i
      session[:station_identifier] = params[:station_identifier].to_i
    end
    @station = Station.find_by_identifier(session[:station_identifier])
  end

  def check
    b = Bike.find_by_identifier(params[:bikeid])
    p session[:station_identifier]
    p b.current_station_identifier
    if session[:station_identifier] == b.current_station_identifier
      current_user.update_attribute(:current_bike_id, params[:bikeid])
      b.update_attribute(:current_station_identifier, nil)
      redirect_to '/ride'
    else
      flash[:error] = "Could not find the bike at this station"
      redirect_to '/checkout'
    end
  end

  def ride
    @bike = Bike.find_by_identifier(current_user.current_bike_id)
    @stations = Station.all.order(identifier: :asc)
    @bikes = Bike.all.order(identifier: :asc)
  end

  def about
  end

  def logout
    session[:user_id]= nil
    redirect_to '/welcome'
  end

  def how_it_works
  end

  def FAQ
  end

  def checkin
    @stations = Station.all.order(identifier: :asc)
  end

  def process_checkin
    @bike = Bike.find_by_identifier(current_user.current_bike_id)
    @bike.update_attribute(:current_station_identifier, params[:station_identifier])
  end

end
