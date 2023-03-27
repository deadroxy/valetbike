Rails.application.routes.draw do
  root to: "stations#index"

  get 'user/profile'
  get 'stations/show'
  get 'renting/index'
end