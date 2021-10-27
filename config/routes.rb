Rails.application.routes.draw do
  root to: "stations#index"
  get 'stations', to: "stations#index"
  get 'bikes', to: "bikes#index"
  get 'rental', to: "rental#index"
  get 'unlocked', to: "rental#unlocked"
end
