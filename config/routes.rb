Rails.application.routes.draw do
   resources :users, only: [:new, :create]
   get 'login', to: 'sessions#new'
   post 'login', to: 'sessions#create'
   get 'welcome', to: 'sessions#welcome'
   get 'authorized', to: 'sessions#page_requires_login'

  resources :users



  root "main#welcome"
  get 'main/welcome'
  get 'main/tutorial'
  get 'main/help'
  get 'main/menu'
  get 'main/profile'
  get 'main/login'
  get 'main/createAccount'
  get 'main/rent'
  get 'main/return'
  #root to: "main/welcome"

end