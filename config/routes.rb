Rails.application.routes.draw do
  root to: "stations#index"
  
#  get "/stations/:identification", to: "stations#index"
    get "/stations/:identifier", to: "station#reverse", as: "station_rev"
end
