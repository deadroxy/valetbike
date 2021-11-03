Rails.application.routes.draw do
  get 'home/Map', to: "home#Map"
  get 'home/Rides', to: "home#Rides"
  get 'home/Pricing', to: "home#Pricing"
  root to: "stations#index"
  get 'stations', to: "stations#index"
  get 'bikes', to: "bikes#index"
  get 'rental', to: "rental#index"
  get 'unlock', to: "rental#unlock"
  get 'rental_success', to: "rental#success"
  get 'login', to: "login#index"
 # get 'signup', to: "login#new"
 # post'signup',to: 'login#create'
  resources :login, only: [:create, :new], :as => 'signup'
  resources :user


end
