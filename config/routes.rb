Rails.application.routes.draw do

  root 'runners#index'

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  resources :requests, only: [:index, :create]

end
