Rails.application.routes.draw do
  resources :users, only: [:new, :create, :checkout]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'about', to: 'sessions#about'
  get 'authorized', to: 'sessions#page_requires_login'
  get 'payment', to: 'sessions#payment'
  get 'checkout', to: 'sessions#checkout'
  post 'checkout', to: 'sessions#check'
  post 'logout', to: 'sessions#logout'
<<<<<<< HEAD
  get 'ride', to: 'sessions#ride'
||||||| 928a4a9
=======
  get 'checkin', to: 'sessions#checkin'

>>>>>>> feec0348d13df98c0663891f099e233757388f82


  resources :places
  #root to: "stations#index"
  root to: "sessions#welcome"
end
