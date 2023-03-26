Rails.application.routes.draw do
  get 'users/index'
  get 'users/new'
  get 'users/edit'
  root to: "stations#index"
end