Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'users/new'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "home#show"

  # This may not be necessary
  # See https://guides.rubyonrails.org/routing.html#restricting-the-routes-created
  # resources :review

  # Show a review
  get '/review/:id', to: 'review#show'

  # Path to admin landing page
  get '/admin', to: 'admin#show'

  # Add a new review
  get '/admin/new', to: 'admin#new'
  post '/admin/new', to: 'admin#create'

  # Edit a review
  get '/admin/edit/:id', to: 'admin#edit', as: 'edit_review'
  patch 'review', to: 'admin#edit_review' # , as: 'update_review'

  # Delete a review
  get '/admin/delete/:id', to: 'admin#delete', as: 'delete_review'
  post '/admin/delete/:id', to: 'admin#destroy', as: 'destroy_review'

  # Admin login page
  # Creates/gets/destroys user sessions
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
