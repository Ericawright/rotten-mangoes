Rails.application.routes.draw do


  resources :movies do
    resources :reviews
  end
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  root 'movies#index'

  namespace :admin do
    resources :users 
  end 

end
