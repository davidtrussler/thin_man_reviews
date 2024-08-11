Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/review', to: 'review#show'

  # Defines the root path route ("/")
  root "home#show"

  resources :review
end
