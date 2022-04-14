Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get 'how_it_works', to: 'home#how_it_works'
  get 'map', to: 'home#map'
  get 'pricing', to: 'home#pricing'
  get 'about', to: 'home#about'
  get 'help', to: 'home#help'
  get 'privacy', to: 'home#privacy'
  get 'terms_of_use', to: 'home#terms_of_use'
  get 'my_account', to: 'home#my_account'
  get 'rent', to: 'home#rent'
end
