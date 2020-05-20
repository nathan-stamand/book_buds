Rails.application.routes.draw do
  resources :authors
  resources :genres
  resources :comments
  resources :posts
  resources :books
  resources :users
end
