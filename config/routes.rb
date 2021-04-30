Rails.application.routes.draw do
  
  root 'static#home'
  match '/auth/:provider/callback', to: 'sessions#github_omniauth', via: [:get, :post]
  #resources :users
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: "sessions#logout"

  get '/my_portfolios', to: 'portfolios#my_portfolios', as: 'my_portfolios'

  resources :portfolios do
    resources :comments, only: [:create]
    resources :trades, only: [:create, :show, :destroy]
    get '/trades/new', to: 'portfolios#my_portfolios'
    post '/trades/new', to: 'trades#create_portfolio_trade', as: 'create_portfolio_trade'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
