Rails.application.routes.draw do
  resources :authors
  resources :genres
  resources :comments
  resources :posts
  resources :books
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
