Rails.application.routes.draw do

  root to: "stations#index"
  resources :users #,  only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  get 'rent/index'
  patch 'rent/update'
  resources :payments, only: [:index, :update]

  #sessions routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  #returns 
  get '/return_bike', to: 'returns#index'
  patch 'returns/update'
  # post '/return_bike', to: 'returns#update'

end
