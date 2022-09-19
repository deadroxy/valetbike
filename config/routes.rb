#section for routing to different web sections 

Rails.application.routes.draw do

  #will want to be root "main#index"
  #root to: "siteDesigns#homepage"

  #example for future pages
  #match "about", to "main#index or wherever you want it routed to", via: : get
  #could try get 'about', to: 'siteDesigns#about'


  root to: "stations#index"



end