Rails.application.routes.draw do
  root "home_page#index"


  match 'home_page', to: "home_page#index", via: :get
  match 'edit_current_trip', to: "edit_current_trip#index", via: :get
  match 'report_a_problem', to: "report_a_problem#index", via: :get
  match 'help', to: "help#index", via: :get
  match 'settings', to: "settings#index", via: :get
  match 'past_trips', to: "past_trips#index", via: :get
  match 'add_more_time', to: "add_more_time#index", via: :get
  match 'active_trip', to: "active_trip#index", via: :get
  match 'trip_planning', to: "trip_planning#index", via: :get
  match 'payment_information', to: "payment_information#index", via: :get
  match 'account', to: "account#index", via: :get
  match 'login_sign_up', to: "login_sign_up#index", via: :get
  match 'membership_plans', to: "membership_plans#index", via: :get
  match 'how_it_works', to: "how_it_works#index", via: :get
  match 'about', to: "about#index", via: :get
  match 'contact_us', to: "contact_us#index", via: :get

  get 'edit_current_trip/index'
  get 'report_a_problem/index'
  get 'help/index'
  get 'settings/index'
  get 'past_trips/index'
  get 'add_more_time/index'
  get 'active_trip/index'
  get 'trip_planning/index'
  get 'payment_information/index'
  get 'account/index'
  get 'login_sign_up/index'
  get 'membership_plans/index'
  get 'how_it_works/index'
  get 'about/index'
  get 'contact_us/index'
  get 'home_page/index'
  get "/stations/:id", to: "stations#show", as: :station
  get "/bikes", to: "bikes#index"
  get "/bikes/:id", to: "bikes#show", as: :bike

  get "about", to: "main#about"
  get"/stations", to: "stations#index"
end
