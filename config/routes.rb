Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'users/new'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "home#show"

  get '/review', to: 'review#show'

  # This may not be necessary
  # See https://guides.rubyonrails.org/routing.html#restricting-the-routes-created
  # resources :review

  # Path to admin landing page
  get '/admin', to: 'admin#show'

  # Add a new review
  get '/admin/new', to: 'admin#new'
  post '/admin/new', to: 'admin#create'

  # Edit a review
  get '/admin/edit/:id', to: 'admin#edit', as: 'edit_review'

  # Delete a review
  get '/admin/delete/:id', to: 'admin#delete', as: 'delete_review'

  # Admin login page
  # Creates/gets/destroys user sessions
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
