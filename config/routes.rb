Rails.application.routes.draw do 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index" 
  
  root to: "stations#index"
   
#  get "/stations/:identification", to: "stations#index"
    get "/stations/:identifier", to: "station#reverse", as: "station_rev"

  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  resources :users, except: [:new]

end
 