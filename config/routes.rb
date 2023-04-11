Rails.application.routes.draw do
  

  root to: "home#index"

  get 'user/profile'

  get 'renting/index'

  match "how-it-works", to:"how_it_works#index", via: :get

  match "locations", to:"stations#index", via: :get
  
  get "faq", to: "faq#index"

  get "renting/new"

  get ':station_id/renting', to: 'renting#index', as: 'renting'

  get 'renting/:station_id/rentings', to: 'renting#create', as: 'newRenting'

  get 'renting/:renting_id', to: 'renting#show', as: 'rentingDetail'


  get "service", to: "service#index"
  post "service", to: "service#create"
  get 'service/index', to: 'service#index', as: 'new_service'

  get 'renting/:renting_id/availableStations', to: 'renting#availableStations', as: 'returnStations'
  get 'renting/:renting_id/:station_id', to: 'renting#return', as: 'return'
  get 'renting/:id/completed', to: 'renting#completed', as: 'completed'
  post 'renting/:id/submit_code(.:format)', to: 'renting#submit_code', as: 'submit_code_renting'

  get 'renting/index'
  get "locations", to: "stations#index"


 

  devise_for :users, skip: [:sessions, :registrations], controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations'
}



as :user do
  get 'login', to: 'users/sessions#new', as: :new_user_session
  post 'login', to: 'users/sessions#create', as: :user_session
  delete 'logout', to: 'users/sessions#destroy', as: :destroy_user_session
  get 'signup', to: 'users/registrations#new', as: :new_user_registration
  post 'signup', to: 'users/registrations#create', as: :user_registration
end


  # resources :renting do
  #   member do
  #     post :submit_code
  #     # get :completed

  #   end
  # end

  resources :cards do 
    member do
      get :delete
      get 'pay', to: 'cards#pay'
    end
  end

  # post '/card', to: 'cards#create'
  # post '/card', to: 'cards#new'
  # get 'cards/index'
  # get 'cards/new'
  # get 'cards/edit'
  # get 'cards/create'
  # get 'cards/pay'

  # get 'cards/:id', to: 'cards#show', as: 'card'


end