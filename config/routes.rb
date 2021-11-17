Rails.application.routes.draw do

  root to: "home#index"

  get 'rides/index'
  get 'map', to: "map#index"
  get 'home/Rides', to: "home#Rides"
  get 'home/faqs', to: "home#faqs"


  get 'stations', to: "stations#index"
  get 'bikes', to: "bikes#index"
  get 'prices', to: "prices#index"

  get 'rent', to: "rental#rent"
  get 'return', to: "rental#return"
  get 'unlock', to: "rental#unlock"
  get 'lock', to: "rental#lock"
  get 'confirmationRent', to: "rental#confirmationRent"
  get 'confirmationReturn', to: "rental#confirmationReturn"

  get 'login', to: "login#index"
  post 'login', to: "login#create"
  delete 'logout', to: "login#destroy"
  resources :users, only: [:create, :new]

end
