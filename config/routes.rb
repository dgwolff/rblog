Rails.application.routes.draw do
  root 'posts#index'

  namespace :admin do
    get "login" => "sessions#new", as: "login"
    get "logout" => "sessions#destroy", as: "logout"
    resources :posts, :categories, :comments, :users, :sessions
  end

  resources :categories

  resources :posts do
    resources :comments
  end
end
