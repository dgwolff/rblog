Rails.application.routes.draw do
  root 'posts#index'

  namespace :admin do
    get "login" => "sessions#new", as: "login"
    get "logout" => "sessions#destroy", as: "logout"
    resources :posts, :categories, :comments, :users, :sessions
  end

  resources :categories, only: [:show]

  resources :posts, only: [:index, :show] do
    resources :comments, only: [:create]
  end
end
