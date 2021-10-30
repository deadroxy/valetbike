Rails.application.routes.draw do
  get 'home/Map', to: "home#Map"
  get 'home/Rides', to: "home#Rides"
  get 'home/Pricing', to: "home#Pricing"
  root to: "stations#index"
  get 'stations', to: "stations#index"
  get 'bikes', to: "bikes#index"
  get 'rental', to: "rental#index"
  get 'unlocked', to: "rental#unlocked"
  get 'login', to: "login#index"
  get 'signup', to: "login#signup"
  post'/signup',to: 'login#create'
  resources :user


end
