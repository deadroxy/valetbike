Rails.application.routes.draw do
  get 'membership/index'
  get 'membership/show'
  get 'membership/new'
  get 'membership/edit'
  get 'membership/delete'

  get 'users/index'
  get 'users/new'
  get 'users/edit'
  
  root to: "stations#index"
end