Rails.application.routes.draw do

  get 'rides/index'
  get 'home/Map', to: "home#Map"
  get 'home/Rides', to: "home#Rides"
  get 'home/Pricing', to: "home#Pricing"

  root to: "home#index"

  get 'stations', to: "stations#index"
  get 'bikes', to: "bikes#index"
  get 'prices', to: "prices#index"

  get 'rent', to: "rental#rent"
  get 'return', to: "rental#return"
  get 'unlock', to: "rental#unlock"
  get 'lock', to: "rental#lock"
  get 'confirmationRent', to: "rental#confirmationRent"
  get 'confirmationReturn', to: "rental#confirmationReturn"

  get 'login', to: "login#index"
  post 'login', to: "login#create"
  delete 'logout', to: "login#destroy"
  resources :users, only: [:create, :new]




end
