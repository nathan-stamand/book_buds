Rails.application.routes.draw do
  resources :authors
  resources :genres
  resources :comments
  resources :posts
  resources :books
  get '/users/login', to: 'users#login'
  post '/users/login', to: 'users#login'
  get '/users/logout', to: 'users#logout'
  resources :users
  
end
