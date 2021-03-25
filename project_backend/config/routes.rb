Rails.application.routes.draw do
  resources :users, only: [:create, :index, :destroy]
  post 'users/login/:id', to: 'users#login'
  resources :games, only: [:create, :index, :update]
  # resources :words, only: [:show]
  post 'words', to: 'words#show'
  resources :sessions, only: [:update, :index]
end
