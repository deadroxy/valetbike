Rails.application.routes.draw do
  root "stations#index"

  get 'bikes', to: 'bikes#index'
end