Rails.application.routes.draw do
  devise_for :users
  
  get "/", to: "pages#home", as: "root"
  
  get "/admin", to: "pages#admin", as: "admin"
  get "/user", to: "pages#user", as: "user"

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

  get "/colours", to: "colours#index", as: "colours"
  post "/colours", to: "colours#create"
  get "/colours/new", to: "colours#new", as: "new_colour"
  get "/colours/:id", to: "colours#show", as: "colour"
  put "/colours/:id", to: "colours#update"
  patch "/colours/:id", to: "colours#update"
  delete "/colours/:id", to: "colours#destroy"
  get "/colours/:id/edit", to: "colours#edit", as: "edit_colour"

  get "/conditions", to: "conditions#index", as: "conditions"
  post "/conditions", to: "conditions#create"
  get "/conditions/new", to: "conditions#new", as: "new_condition"
  get "/conditions/:id", to: "conditions#show", as: "condition"
  put "/conditions/:id", to: "conditions#update"
  patch "/conditions/:id", to: "conditions#update"
  delete "/conditions/:id", to: "conditions#destroy"
  get "/conditions/:id/edit", to: "conditions#edit", as: "edit_condition"

  get "/sizes", to: "sizes#index", as: "sizes"
  post "/sizes", to: "sizes#create"
  get "/sizes/new", to: "sizes#new", as: "new_size"
  get "/sizes/:id", to: "sizes#show", as: "size"
  put "/sizes/:id", to: "sizes#update"
  patch "/sizes/:id", to: "sizes#update"
  delete "/sizes/:id", to: "sizes#destroy"
  get "/sizes/:id/edit", to: "sizes#edit", as: "edit_size"

 

  get "*path", to: "pages#not_found", constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }

end
