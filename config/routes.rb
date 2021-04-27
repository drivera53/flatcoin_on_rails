Rails.application.routes.draw do
  
  root 'static#home'
  match '/auth/:provider/callback', to: 'sessions#github_omniauth', via: [:get, :post]
  #resources :users
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: "sessions#logout"

  get '/my_portfolios', to: 'portfolios#my_portfolios'

  resources :portfolios do
    resources :comments, only: [:create]
    resources :trades, only: [:create]
    resources :pickers, only: [:create]
  end

  #get '/portfolios/:portfolio_id/trades/new', to: 'trades#new_portfolio_trade', as: 'new_portfolio_trade' 
  post '/portfolios/:portfolio_id/trades/new', to: 'trades#create_portfolio_trade'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
