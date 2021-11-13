Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  get 'bikes/index'
  get 'bikes/show'
  get "stations/index"
  get 'cusserve/contacs'
  root to: "home#index"
end
