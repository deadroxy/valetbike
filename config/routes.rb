Rails.application.routes.draw do
  root to: "stations#index"

  get "bikes/:order", to: "bikes#index"
  get "stations/:order", to: "stations#index"

end