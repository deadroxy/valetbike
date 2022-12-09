Rails.application.routes.draw do
  # root to: "stations#index"
  root 'welcome#index'
  get 'GeoJSON', to: 'stations#GeoJSON'
  get 'checkout', to: 'checkouts#show'
  #successfully purchase the product
  get 'checkout/success', to: 'checkouts#success' 
  get 'billing', to:'billing#show'

  match '/about', to: "welcome#about", via: :get
  match '/index', to: "welcome#index", via: :get
  match '/service', to: "welcome#service", via: :get
  match '/stations/:identifier', to: "stations#show", via: :get
  # match '/login', to: "stations#index", via: :get
  get 'sign_up',  to: 'users#new', via: :get
  post 'sign_up', to: 'users#create'
  get 'sign_in',   to: 'sessions#new'
  post 'sign_in',   to: 'sessions#create', as: 'log_in'
  get 'logout',  to: 'sessions#destroy'
  
  # authenticate :user, lambda { |u| u.admin? } do
  #   mount Sidekiq::Web => '/sidekiq'
  # end
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :sessions,   only: [:new, :create, :destroy]
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

end