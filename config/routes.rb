Rails.application.routes.draw do
  get 'tags/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root to: "homes#top"
  get "home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update] do
    resources :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    get "search" => "users#search"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "search" => 'searches#search'
  get 'search_tag' => 'search#search_tag'

  resources :messages, only: [:show, :create, :destroy]
  resources :entries, only: [:index, :destroy] do
    resource :room, only: [:destroy]
  end

  resources :groups do
    resource :group_users, only: [:create, :destroy]
    resources :events, only: [:new, :create]
    get 'events' => 'events#sent'
  end


end