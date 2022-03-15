Rails.application.routes.draw do
  #root to: "stations#index"
  get "about", to: "about#index"
  get "login", to: "login#index"
end
