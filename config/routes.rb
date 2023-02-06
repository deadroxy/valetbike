Rails.application.routes.draw do
  root to: "stations#index"

  # route for the bike index
  get "bike" => "bikes#index"
end