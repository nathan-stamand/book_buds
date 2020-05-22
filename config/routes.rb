Rails.application.routes.draw do
  resources :authors
  resources :genres
  resources :comments
  resources :posts
  resources :books
  get '/users/login', to: 'users#login'
  resources :users
  
end
