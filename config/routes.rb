Rails.application.routes.draw do
  get 'home/Map', to: "home#Map"
  get 'home/Rides', to: "home#Rides"
  get 'home/Pricing', to: "home#Pricing"

  get 'home/Signup', to: "home#Signup"
  get 'home/Login', to: "home#Login"
  root to: "home#index"

  get 'stations', to: "stations#index"
  get 'bikes', to: "bikes#index"
  get 'rental', to: "rental#index"
  get 'unlock', to: "rental#unlock"
  get 'confirmation', to: "rental#confirmation"
  get 'rental_success', to: "rental#success"
  get 'login', to: "login#index"
  resources :users, only: [:create, :new]
 



end

