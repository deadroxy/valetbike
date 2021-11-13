Rails.application.routes.draw do
  get 'cusserve/contacs'
  get 'bikes/index'
  get 'bikes/show'
  root to: "stations#index"
end
