Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:create, :update, :destroy, :index, :show]
  # get "/users", to: "users#index", as: 'users'
  # post "/users", to: "users#create" 
  # get "/users/new", to: "users#new", as: 'new_user'
  # get "/users/:id/edit", to: "users#edit", as: 'edit_user'
  # get "users/:id", to: "users#show", as: 'user'
  # patch "/users/:id", to: "users#update" 
  # put "/users/:id", to: "users#update" 
  # delete "/users/:id", to: "users#destroy" 
  resources :artworks, only: [:create, :update, :destroy, :index, :show]
  resources :artwork_shares, only: [:create, :destroy]
end
