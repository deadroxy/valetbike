Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'user#add'
  # get 'user/add'
  # get 'about/aboutUs'
  # get 'about/contact'
  # root 'sessions#login'
  # resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
  # get '/login', to: 'sessions#login'
  # post '/login', to: 'sessions#create'
  # get '/logout', to: 'sessions#destroy'
  # post '/logout', to: 'sessions#destroy'
  #
  # get "users/new"

  root 'welcome#index'
  get 'welcome', to: 'welcome#index'
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'
  get 'password', to: 'passwords#edit', as: 'edit_password'
  patch 'password', to: 'passwords#update'
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  post 'password', to: 'passwords#edit'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'
  get 'plans', to: 'payment#plans'




end
