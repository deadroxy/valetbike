Rails.application.routes.draw do
  root to: "stations#index"
  get "stations/show"
end