Rails.application.routes.draw do
    #home/index was inserted by making Home controller index. I hope to make this the defail, have html that provides links to any of these other controllers and views
  root to: "home#index"
  get "/stations", to: "stations#index"
  get "/bikes", to: "bikes#index"
end
