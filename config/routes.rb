Rails.application.routes.draw do
  
  root 'static#home'
  match '/auth/:provider/callback', to: 'sessions#github_omniauth', via: [:get, :post]
  #resources :users
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: "sessions#logout"

  resources :portfolios do
    resources :comments, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
