Rails.application.routes.draw do
  get 'membership/index'
  get 'membership/show'
  get 'membership/new'
  get 'membership/create'
  get 'membership/edit'
  get 'membership/update'
  get 'membership/delete'
  get 'membership/destroy'
  root to: "stations#index"
end