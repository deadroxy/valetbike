Rails.application.routes.draw do
  root to: "pages#home"

  # test
  get "map", to: "map#show"
  #root "rentals#new"
  
  
  #get "/stations/:identification", to: "stations#main"
  get "stations", to: "stations#main", as:"stations"
  #get "/stations/:identifier", to: "station#reverse", as: "station_rev"

  # hsm mods
  get "/bikes/unlock", to: "bikes#unlock"
  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"


  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  get "user_home", to: "users#show"
  post 'login', to: 'sessions#create'

  

  delete "logout", to: "sessions#destroy"

  get '/users/:id', to: 'users#menu', as: 'user'
  get "user/show"
  
  # payment page info
  get "payment", to:'payment#new' # testing
  get "bikes", to: "bikes#index" # testing 

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  match'ride',to:"bikes#index", via: :get
  resources :bikes, only: [:index]
  resources :stations, only: [:main, :show]
  resources :users, except: [:new]
  resources :rentals, only: [:new, :create]

  get "rename", to: "username#edit", as: :edit_username
  patch "rename", to: "username#update"

  get "change_address", to: "address#edit", as: :edit_address
  patch "change_address", to: "address#update"

  get "change_wallet", to: "wallet#edit", as: :edit_wallet
  post "change_wallet", to: "wallet#update"

end
