Rails.application.routes.draw do
  get 'sessions/new'
  
  root 'pages#index'
  get 'pages/help'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
  # ↓
  # get '/users', to: 'users#index'
  # get '/users/new', to: 'users#new'
  # post '/users', to: 'users#create'
  # ・・・・・

  resources :topics
  # get '/topics', to: 'topics#index'
  # get '/topics/new', to: 'topics#new'
  # post '/topics', to: 'topics#create'
  resources :comments
  
  get 'favorites/index'
  post '/favorites', to:'favorites#create'
  delete '/favorites', to:'favorites#destroy'
  
end


