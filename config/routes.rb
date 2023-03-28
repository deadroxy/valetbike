Rails.application.routes.draw do
  root to: "stations#index"
  
#  get "/stations/:identification", to: "stations#index"
    get "/stations/:identifier", to: "station#reverse", as: "station_rev"

  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  resources :users, except: [:new]

end
