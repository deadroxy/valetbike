Rails.application.routes.draw do
  root to: "pages#home"
  
  #get "/stations/:identification", to: "stations#main"
  get "stations", to: "stations#main", as:"stations"
  get "/stations/:identifier", to: "station#reverse", as: "station_rev"

  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  get "user_home", to: "users#show"
  post 'login', to: 'sessions#create'
  delete "logout", to: "sessions#destroy"
  get '/users/:id', to: 'users#menu', as: 'user'
  get "user/show"
  resources :users, except: [:new]

end
