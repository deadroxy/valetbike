Rails.application.routes.draw do
  get 'sessions/new'
  get 'home/Map', to: "home#Map"
  get 'home/Rides', to: "home#Rides"
  get 'home/Pricing', to: "home#Pricing"

  root to: "home#index"

  get 'stations', to: "stations#index"
  get 'bikes', to: "bikes#index"
  get 'rental', to: "rental#index"
  get 'unlock', to: "rental#unlock"
  get 'confirmation', to: "rental#confirmation"
  get 'rental_success', to: "rental#success"
  get 'login', to: "login#index"
  post 'login', to: "login#create"
  delete 'logout', to: "login#destroy"
  resources :users, only: [:create, :new]




end
