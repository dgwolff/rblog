Rails.application.routes.draw do
  root 'posts#index'

  get 'about' => 'about#index'
  get 'contact' => 'contacts#new'
  get 'contacts/create'

  resources 'contacts', only: [:new, :create]

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
