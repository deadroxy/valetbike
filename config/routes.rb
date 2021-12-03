Rails.application.routes.draw do
  resources :users, only: [:new, :create, :checkout]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'about', to: 'sessions#about'
  get 'authorized', to: 'sessions#page_requires_login'
  get 'checkout', to: 'sessions#checkout'
  post 'checkout', to: 'sessions#check'
  get 'payment', to: 'sessions#payment'


  resources :places
  #root to: "stations#index"
  root to: "sessions#welcome"
end
