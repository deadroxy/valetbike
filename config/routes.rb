Rails.application.routes.draw do
  root "main#index"

  get 'index', to: "main#index"
  get 'tutorial', to: "main#tutorial"
  get 'help', to: "main#help"

  resources :users, only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  # delete 'logout' to: 'sessions#delete'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'

  resources :users, except: [:show]
  resources :sessions, except: [:show]
  resources :main, except: [:show]



  
 

  # get 'main/menu'
  get 'users/profile' 
  get 'sessions/new'
  get 'users/new'
  # get 'main/rent'
  # get 'main/return'
  # get 'main/return'

end