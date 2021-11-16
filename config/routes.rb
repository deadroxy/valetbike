Rails.application.routes.draw do
  root to: "static#landing"
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :tabs, only: [:new]
  #get '/views/tab_pages/', to: 'tab_pages#landing', as: :tab_pages
end
