Rails.application.routes.draw do
  root to: "main#index"
  get 'main/index'
  get 'main/tutorial'
  get 'main/help'

  resources :users, only: [:new, :create]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'main/welcome', to: 'sessions#welcome'
  
  get 'authorized', to: 'sessions#page_requires_login'

  

  resources :users
  
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/login'
  # get 'sessions/welcome'
  # get 'users/new'
  # get 'users/create'

  #root to: "stations#index"
end