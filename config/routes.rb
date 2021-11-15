Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  get 'bikes/index'
  get 'bikes/show'
  get 'bikes/unlock'
  post 'bikes/unlock'
  get 'bikes/unlockConfirm'
  get 'bikes/returnConfirm'
  get "stations/index"
  root to: "home#index"
end
