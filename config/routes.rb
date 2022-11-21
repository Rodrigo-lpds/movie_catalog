Rails.application.routes.draw do
  resources :logs, only: [:index]
  resources :casts
  resources :actors
  resources :comments
  resources :movies
  post 'movies/add_actor_to_cast', to: 'movies#add_actor_to_cast', as: :add_actor_to_cast
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'movies#index'
end
