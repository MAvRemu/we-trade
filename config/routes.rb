Rails.application.routes.draw do
  devise_for :users
  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end



  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :posts do
    resources :post_comments, only: [:create, :destroy]
  end
  resources :cryptos do
    resources :crypto_comments, only: [:create, :destroy]
  end
  resources :squads do
    resources :squad_messages, only: [:create, :destroy]
    resources :memberships, only: [:create, :destroy]
  end
end
