Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/review', to: 'review#show'

  # Defines the root path route ("/")
  root "home#show"

  resources :review

  # Path to admin landing page
  get '/admin', to: 'admin#show'

  get '/admin/new', to: 'admin#new'
  post '/admin/new', to: 'admin#create'
end
