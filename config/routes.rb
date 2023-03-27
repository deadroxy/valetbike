Rails.application.routes.draw do
  root to: "stations#index"
  get "faq", to: "faq#index"
  get "payments", to: "payments#index"
end