Rails.application.routes.draw do
  root to: "static#landing"
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :tabs, only: [:new, :index]
  resources :memberships, only: [:new, :create, :show, :index, :delete, :destroy]
  get 'memberships/show'

#Routes for paypal
  #get '/', :to => 'orders#index'
  get 'orders/index'
  post :create_order, :to => 'orders#create_order'
  post :capture_order, :to => 'orders#capture_order'
end
