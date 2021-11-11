Rails.application.routes.draw do
  get 'bikes/index'
  get 'bikes/show'
  root to: "stations#index"
end
