Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  get 'bikes/index'
  get 'bikes/show'
  get "stations/index"
  get 'cusserve/contacs'
  get 'billings/new/mastercard', to: 'billings#mastercard'
  get 'billings/new/VISA', to: 'billings#VISA'
  get 'billings/new/AirPay', to: 'billings#AirPay'
  post 'billings/new/create/mastercard', to: 'billings#create_mastercard'
  post 'billings/new/create/VISA', to: 'billings#create_VISA'
  resources :billings 
  root to: "home#index"
end
 