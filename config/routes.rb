Rails.application.routes.draw do

  # main page routes
  root to: "main#home"
  match "how-it-works", to:"main#how_it_works", via: :get
  get "faq", to: "main#faq"

  # station routes
  match "locations(/:renting_id)", to:"stations#index", via: :get
  resources :stations  do
    collection do
      get :search
    end
  end

  # Renting routes
  get 'renting/index'
  get "renting/create"
  get 'renting/show'
  get 'renting/return'
  get 'renting/completed'
  post 'renting/:id/submit_code(.:format)', to: 'renting#submit_code', as: 'submit_code_renting'

  # services routes
  get "service", to: "service#index"
  post "service", to: "service#create"
  get 'service/index', to: 'service#index', as: 'new_service'

  # user routes
  get 'user/profile'

  devise_for :users, skip: [:sessions, :registrations], controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    get 'login', to: 'users/sessions#new', as: :new_user_session
    post 'login', to: 'users/sessions#create', as: :user_session
    delete 'logout', to: 'users/sessions#destroy', as: :destroy_user_session

    get 'signup', to: 'users/registrations#new', as: :new_user_registration
    post 'signup', to: 'users/registrations#create', as: :user_registration

    # routes for Google authentication
    get 'auth/:provider/callback', to: 'users/omniauth_callbacks#google_oauth2'
    get 'auth/failure', to: redirect('/')
    get 'google_signin', to: 'users/sessions#google_signin', as: :google_signin
   

    # routes for Facebook authentication
    get 'auth/facebook/callback', to: 'users/omniauth_callbacks#facebook'
    get 'auth/failure', to: redirect('/')
    get 'facebook_signin', to: 'users/sessions#facebook_signin', as: :facebook_signin
   
  end

  # payment routes
  resources :cards do 
    member do
      get :delete
      get 'pay', to: 'cards#pay'
    end
  end

end
