Rails.application.routes.draw do

   
  resources :bikes, :stations

  root to: "main#index"

end