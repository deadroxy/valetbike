Rails.application.routes.draw do
  root to: "home#index"
  get "/home", to: "home#index"
  get "/stations", to: "stations#index"
  get "/bikes", to: "bikes#index"
  # root to: "stations#index"
  # root to: "bikes#index"
end