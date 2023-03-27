Rails.application.routes.draw do
  root to: "stations#index"
  
    # get "/stations/:identifier", to: "station#reverse", as: "station_rev"

  resources :bikes, only: [:index]
  resources :stations, only: [:index]
end
