Rails.application.routes.draw do
  devise_for :users

  get "/", to: "pages#home", as: "root"
  
  get "/listings", to: "listings#index", as: "listings"
  post "/listings", to: "listings#create"
  get "/listings/new", to: "listings#new", as: "new_listing"
  get "/listings/:id", to: "listings#show", as: "listing"
  put "/listings/:id", to: "listings#update"
  patch "/listings/:id", to: "listings#update"
  delete "/listings/:id", to: "listings#destroy"
  get "/listings/:id/edit", to: "listings#edit", as: "edit_listing"


  get "payments/success", to: "payments#success"
  post "payments/webhook", to: "payments#webhook"

  get "/makes", to: "makes#index", as: "makes"
  post "/makes", to: "makes#create"
  get "/makes/new", to: "makes#new", as: "new_make"
  get "/makes/:id", to: "makes#show", as: "make"
  put "/makes/:id", to: "makes#update"
  patch "/makes/:id", to: "makes#update"
  delete "/makes/:id", to: "makes#destroy"
  get "/makes/:id/edit", to: "makes#edit", as: "edit_make"

  get "*path", to: "pages#not_found", constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }

end
