Rails.application.routes.draw do
  root to: "stations#index"
  get "bike" => "bikes#index"
end