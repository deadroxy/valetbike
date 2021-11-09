Rails.application.routes.draw do

  root to: "stations#index"

  get 'payment/index'
  
end
