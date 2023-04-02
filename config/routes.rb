Rails.application.routes.draw do
  get 'signup/signup'
  get 'login/login'
  root to: "stations#index"
  get '/login', to: 'login#login'
  get '/signup', to: 'signup#signup'
end