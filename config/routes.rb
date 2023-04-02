Rails.application.routes.draw do
  devise_for :logins, controllers: {
    sessions: 'logins/sessions',
    registrations: 'logins/registrations',
    passwords: 'logins/passwords',
    confirmations: 'logins/confirmations',
    #omniauth_callbacks: 'logins/omniauth_callbacks',
    unlocks: 'logins/unlocks'
  }

  get 'logins/custom_action', to: 'logins/custom_controller#custom_action'

  get 'membership/index'
  get 'membership/show'
  get 'membership/new'
  get 'membership/edit'
  get 'membership/delete'

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

  get 'users/index'
  get 'users/new'
  get 'users/edit'
  
  root to: "stations#index"
end