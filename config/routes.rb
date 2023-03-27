Rails.application.routes.draw do
  get 'main/welcome'
  get 'main/tutorial'
  get 'main/help'
  get 'main/menu'
  get 'main/profile'
  get 'main/login'
  get 'main/createAccount'
  get 'main/rent'
  get 'main/return'
  root to: "stations#index"
end