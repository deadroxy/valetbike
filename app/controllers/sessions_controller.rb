class SessionsController < ApplicationController

<<<<<<< HEAD

  skip_before_action :authorized, only: [:new, :create, :welcome, :checkout, :about, :payment, :checkin]

=======
<<<<<<< HEAD
  skip_before_action :authorized, only: [:new, :create, :welcome, :checkout, :about, :payment]
=======
  skip_before_action :authorized, only: [:new, :create, :welcome, :checkout, :check, :about, :payment]
>>>>>>> 408e7f0973c42ced99fbf0cd2af80537ca85b2fe
>>>>>>> 1c7a10dee146161a15fee8137eccf62d9b25494f

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])

        # line 14 (right under this comment) was in the original article but giving me an error message

        # sessions[:user_id] = @user.id

        # the error was that i hadn't created/defined a local variable/method named sessions, which is true, but it also
        # offered the suggestion to change it to 'session' which i did (see below), but i don't know if
        # this messes up anything ;-;

        session[:user_id] = @user.id

        redirect_to '/welcome'
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
  end

  def check
    @bike = Bike.find_by(identifier: params[:bikeid])
    @user = User.find(session[:user_id])
    @user.current_bike_id = @bike.identifier

  end

  def about
  end

<<<<<<< HEAD
  def payment
=======
  def logout
    session[:user_id]= nil
    redirect_to '/welcome'
>>>>>>> 408e7f0973c42ced99fbf0cd2af80537ca85b2fe
  end

  def checkin
  end


end
