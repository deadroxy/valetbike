Rails.application.routes.draw do

  resources :users
  root to: "stations#index"

  get 'payment/index'

end
