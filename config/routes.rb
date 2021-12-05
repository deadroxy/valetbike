Rails.application.routes.draw do
  get 'user/show'
  root to: "static#landing"
  devise_for :users
  resources :users
  #resources :sessions, only: [:new, :create, :destroy]
  resources :tabs, only: [:new, :index]
  resources :memberships, only: [:new, :create, :show, :index, :delete, :destroy]
  get 'memberships/show'
  get 'orders/index'
  post '/orders/submit', to: 'orders#submit'

#Routes for paypal
  post 'orders/paypal/create_payment'  => 'orders#paypal_create_payment', as: :paypal_create_payment
  post 'orders/paypal/execute_payment'  => 'orders#paypal_execute_payment', as: :paypal_execute_payment
  post 'orders/paypal/create_subscription'  => 'orders#paypal_create_subscription', as: :paypal_create_subscription
  post 'orders/paypal/execute_subscription'  => 'orders#paypal_execute_subscription', as: :paypal_execute_subscription
  #get '/', :to => 'orders#index'
  #post :create_order, :to => 'orders#create_order'
  #post :capture_order, :to => 'orders#capture_order'
end
