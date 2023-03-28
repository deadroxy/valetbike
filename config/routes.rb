Rails.application.routes.draw do

  root to: "stations#index"

  match "how-it-works", to:"how_it_works#index", via: :get

  match "payments", to:"payments#index", via: :get

  match "locations", to:"stations#index", via: :get
  
  get "faq", to: "faq#index"
  
  get "payments", to: "payments#index"

end