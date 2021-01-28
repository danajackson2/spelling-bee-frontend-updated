Rails.application.routes.draw do
  resources :users, only: [:create, :index]
  post 'users/login/:id', to: 'users#login'
  resources :games, only: [:create, :index, :update]
  resources :words, only: [:show]
  resources :sessions, only:[:update]
  patch 'sessions', to: 'sessions#score'
end
