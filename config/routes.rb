Rails.application.routes.draw do

  root to: "stations#index"
  resources :users #,  only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  get 'payment/index'
end
