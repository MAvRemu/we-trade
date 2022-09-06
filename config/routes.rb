Rails.application.routes.draw do
  devise_for :users
  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  root to: "pages#home"

  get 'mycryptos', to: 'cryptos#mycryptos'
  get 'myposts', to: 'posts#myposts'

  resources :posts do
    resources :post_comments, only: [:create, :destroy]
    resources :post_votes, only: [:create, :destroy]
    resources :post_bookmarks, only: [:create, :update]
  end
  resources :post_bookmarks, only: [:destroy]

  resources :cryptos do
    resources :crypto_comments, only: [:create, :destroy]
    resources :crypto_bookmarks, only: [:create, :update]
  end
  resources :crypto_bookmarks, only: [:destroy]

  resources :squads do
    resources :squad_messages, only: [:create, :destroy]
    resources :memberships, only: [:create]

    post '/watchings', to: 'squads#addToWatchlist'
  end
  resources :memberships, only:[:destroy]

end
