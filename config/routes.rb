Rails.application.routes.draw do
  resources :authors, only: [:index, :show]
  resources :genres, only: [:index, :show]

  resources :books do 
    resources :posts 
  end
  get '/users/login', to: 'users#login'
  post '/users/login', to: 'users#login'
  get '/users/logout', to: 'users#logout'
  
  resources :users do 
    resources :books
    resources :posts
  end
  
end
