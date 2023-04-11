Rails.application.routes.draw do
  get 'cards/index'
  get 'cards/show'
  get 'cards/new'
  get 'cards/edit'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    #omniauth_callbacks: 'users/omniauth_callbacks',
    unlocks: 'users/unlocks'
  }
  resources :billing_infos
  #get 'billing_infos/new'
  #get 'billing_infos/create'
  devise_for :logins, controllers: {
    sessions: 'logins/sessions',
    registrations: 'logins/registrations',
    passwords: 'logins/passwords',
    confirmations: 'logins/confirmations',
    #omniauth_callbacks: 'logins/omniauth_callbacks',
  }
  # devise_for :logins, controllers: {
  #   sessions: 'logins/sessions',
  #   registrations: 'logins/registrations',
  #   passwords: 'logins/passwords',
  #   confirmations: 'logins/confirmations',
  #   #omniauth_callbacks: 'logins/omniauth_callbacks',
  #   unlocks: 'logins/unlocks'
  # }

  # get 'logins/custom_action', to: 'logins/custom_controller#custom_action'
  # get 'users/custom_action', to: 'users/custom_controller#custom_action'

  get 'membership/index'
  get 'membership/show'
  get 'membership/new'
  get 'membership/edit'
  get 'membership/delete'

  get 'pages/about'
  get 'pages/contact'
  get 'pages/faq'
  get 'pages/home'
  get 'pages/privacypol'
  get 'pages/terms'
  get 'pages/userag'
  get 'pages/rental'
  get 'pages/success'


  resources :stations do
    member do
      get :delete
    end
  end
  # get 'stations/index'
  # get 'stations/show'
  # get 'stations/new'
  # get 'stations/edit'
  # get 'stations/delete'

  get 'users/code'
  get 'users/consent'
  get 'users/edit'
  get 'users/index'
  get 'users/new'
  get 'users/show'
  get 'users/login'
  

  root to: "pages#home"
end