Rails.application.routes.draw do
  root to: "stations#index"

  get "/stations/:id", to: "stations#reverse"
  get "/bikes", to: "bikes#index"
  
end
