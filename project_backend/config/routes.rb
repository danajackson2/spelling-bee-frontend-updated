Rails.application.routes.draw do
  resources :users, only: [:create, :index]
  resources :games, only: [:create, :index]
  resources :words, only: [:show]
end
