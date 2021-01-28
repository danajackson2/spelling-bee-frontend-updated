Rails.application.routes.draw do
  resources :users, only: [:create, :index]
  resources :games, only: [:create, :index, :update]
  resources :words, only: [:show]
end
