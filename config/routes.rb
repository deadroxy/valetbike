Rails.application.routes.draw do
  root to: "pages#home"
  
  #get "/stations/:identification", to: "stations#main"
  get "stations", to: "stations#main", as:"stations"
 # get "/stations/:identifier", to: "station#reverse", as: "station_rev"

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"



  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  get "user_home", to: "users#show"
  post 'login', to: 'sessions#create'


  delete "logout", to: "sessions#destroy"

  get '/users/:id', to: 'users#menu', as: 'user'
  get "user/show"
  match'ride',to:"bikes#index", via: :get
  resources :bikes, only: [:index]
  resources :stations, only: [:main, :show]
  resources :users, except: [:new]

end
