Rails.application.routes.draw do
  resources :users, only: [:new, :create]
<<<<<<< HEAD

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  get 'welcome', to: 'sessions#welcome'
  
=======
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
>>>>>>> temp-branch
end
