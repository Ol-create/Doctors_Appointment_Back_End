Rails.application.routes.draw do
  # devise_for :add_devise_to_users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "users#index"
  resources :users
  resources :doctors, only: [:index, :show, :create]
  resources :bookings, only: [:index, :show, :create, :destroy]
  post "/signup", to: "users#create"
  post "/login", to: "sessions#login"
  post "/logout", to: "sessions#logout"
end
