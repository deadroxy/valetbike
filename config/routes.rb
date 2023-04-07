Rails.application.routes.draw do
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
  

  root to: "pages#home"
end