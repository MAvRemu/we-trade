Rails.application.routes.draw do
  devise_for :users
  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  root to: "pages#home"

  get 'mycryptos', to: 'pages#mycryptos'
  get 'myposts', to: 'pages#myposts'

  resources :posts do
    resources :post_comments, only: [:create, :destroy]
    resources :post_votes, only: [:create, :destroy]
  end
  resources :cryptos do
    resources :crypto_comments, only: [:create, :destroy]
  end
  resources :squads do
    resources :squad_messages, only: [:create, :destroy]
    resources :memberships, only: [:create]
  end
  resources :memberships, only:[:destroy]
end
