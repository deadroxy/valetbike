Rails.application.routes.draw do
  get 'membership/index'
  get 'membership/show'
  get 'membership/new'
  get 'membership/edit'
  get 'membership/delete'
  root to: "stations#index"
end