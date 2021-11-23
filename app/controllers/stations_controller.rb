class StationsController < ApplicationController
  before_action :allow_iframe_requests, only: [:index]

  def allow_iframe_requests
    response.headers['X-Frame-Options'] = 'ALLOW-FROM https://maps.googleapis.com'
    # response.headers.delete "X-Frame-Options"
  end

  def index
    @stations = Station.all.order(identifier: :asc)
  end
  
end
