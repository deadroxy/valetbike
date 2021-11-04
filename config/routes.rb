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
  get 'unlocked', to: "rental#unlocked"
  get 'login', to: "login#index"
  get 'login/signup'

end
