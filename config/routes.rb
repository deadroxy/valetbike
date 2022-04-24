Rails.application.routes.draw do
  devise_for :users

  resources :charges, only: [:new, :create]
  
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
  
  get 'pricing/pay_per_ride_pass'
  get 'pricing/day_pass'
  get 'pricing/monthly_membership'
  get 'pricing/annual_membership'
  get 'pricing/student_annual_membership'
  get 'pricing/access_pass'
  get 'pricing/founding_member'
end
