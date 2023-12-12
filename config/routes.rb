Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'users/registrations'}
  root "home_page#index"

  scope controller: :static do 
    get  :pricing 
  end

  namespace :purchase do
    resources :checkouts 
  end 

  resources :memberships 
  resources :webhooks, only: :create
  resources :billings, only: :create
  get "success", to: "purchase/checkouts#success"
  # stripe listen --forward-to localhost:4242/stripe/webhooks
  # post 'stripe/webhooks', to: 'stripe/webhooks#create'
  # get 'membership', to: 'stripe/checkout#pricing'
  # post 'stripe/checkout', to: 'stripe/checkout#checkout'
  # get 'stripe/checkout/success', to: 'stripe/checkout#success'
  # get 'stripe/checkout/cancel', to: 'stripe/checkout#cancel'
  # post 'stripe/billing_portal', to: 'stripe/billing_portal#create'


  get 'active_trip/index'
  get '/account', to: 'account#index'
  # get 'membership', to: 'home_page#membership'
  get 'howitworks', to: 'home_page#howitworks'
  get 'about', to: 'home_page#about'
  get 'contactus', to: 'home_page#contactus'
  get 'base_map', to: 'active_trip#base_map'
  get 'rent_map', to: 'active_trip#rent_map'
  get 'return_map', to: 'active_trip#return_map'
  get "/stations/:id", to: "stations#show", as: :station
  get "/bikes", to: "bikes#index"
  get "/bikes/:id", to: "bikes#show", as: :bike
  get 'testing', to: 'active_trip#testing'
  get"/stations", to: "stations#index"
  get "/rentals/:id", to: "rentals#rent", as: :rental 
  get "/rentals/", to: "rentals#show"
  # get "/return", to: "rentals#index"
  get "stations/return/:id", to: "stations#return", as: :station_return
end

