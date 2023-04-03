Rails.application.routes.draw do
  get 'cards/index'
  get 'cards/new'
  get 'cards/edit'
  get 'cards/create'
  get 'cards/pay'

  root to: "home#index"


  get 'user/profile'

  get 'renting/index'

  match "how-it-works", to:"how_it_works#index", via: :get

  match "payments", to:"payments#index", via: :get

  match "locations", to:"stations#index", via: :get
  
  get "faq", to: "faq#index"
  get "renting", to: "renting#index"
  
  get "payments", to: "payments#index"
  
  get 'user/profile'

  get 'renting/index'


end