Rails.application.routes.draw do

  root 'runners#index'

  resources :users, only: [:new, :create] do
    resources :requests, only: [:create] do
    end
  end

  resources :sessions, only: [:new, :create, :destroy]

  resources :requests, only: [:create]

end
