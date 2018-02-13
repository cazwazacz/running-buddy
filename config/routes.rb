Rails.application.routes.draw do

  root 'runners#index'

  resources :users

  resources :sessions

  resources :requests

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
