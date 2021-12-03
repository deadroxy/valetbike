Rails.application.routes.draw do
  resources :users, only: [:new, :create, :checkout]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'about', to: 'sessions#about'
  get 'how_it_works', to: 'sessions#how_it_works'
  get 'FAQ', to: 'sessions#FAQ'
  get 'authorized', to: 'sessions#page_requires_login'
  get 'payment', to: 'sessions#payment'
  get 'checkout', to: 'sessions#checkout'
  post 'checkout', to: 'sessions#check'
  post 'logout', to: 'sessions#logout'
  get 'ride', to: 'sessions#ride'
  post 'checkin', to: 'sessions#checkin'


  resources :places
  #root to: "stations#index"
  root to: "sessions#welcome"
end
