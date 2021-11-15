Rails.application.routes.draw do
  root to: "static#landing"
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :tabs, only: [:show]
  get '/views/tab_pages/', to: 'tab_pages#index', as: :tab_pages
#  get "/views/tab_pages/:page" => "tab_pages#{show}"

end
