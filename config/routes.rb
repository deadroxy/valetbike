Rails.application.routes.draw do

  root to: "stations#index"
  resources :users #,  only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  get 'rent/index'
  patch 'rent/update'
  resources :payments, only: [:index]

  #sessions routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
