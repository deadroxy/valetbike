Rails.application.routes.draw do
  
  root to: "stations#index"
  
  resources :users, :except => [:index]
  get 'users/delete'
  
  get 'login', to: 'sessions#login'
  
  
  
  #default route (keep at bottom)
  get ':controller(/:action(/:id))'
  
end
