Rails.application.routes.draw do


  # get '/user_mailer/delete_email', to: 'mailers/user_mailer#delete_email', as: 'delete_email' 
  post '/movies/search', to: 'movies#search', as: 'search' 

  resources :movies do
    resources :reviews
  end
  resources :users
  resources :session
  root 'movies#index'

  namespace :admin do
    resources :users 
    get '/preview_user/:id', to: '/admin/users#preview_mode', as: 'preview' 
  end 

end
