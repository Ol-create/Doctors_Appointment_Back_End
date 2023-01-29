Rails.application.routes.draw do
  # devise_for :add_devise_to_users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  resources :users
  resources :doctors, only: [:index, :show, :create]
end
