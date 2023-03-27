Rails.application.routes.draw do
  get 'renting/index'
  root to: "stations#index"

  get 'user/profile'
  get 'stations/show'
end