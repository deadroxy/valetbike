Rails.application.routes.draw do
  root to: "stations#index"

  match 'login', to: "stations#login", via: :get 

end

