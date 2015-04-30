Rails.application.routes.draw do



 post '/movies/search', to: 'movies#search', as: 'search' 

  resources :movies do
    resources :reviews
  end
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  root 'movies#index'

  namespace :admin do
    resources :users 
    get '/preview_user/:id', to: '/admin/users#preview_mode', as: 'preview' 
  end 

end
