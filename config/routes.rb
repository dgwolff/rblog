Rails.application.routes.draw do
  root 'posts#index'

  get 'contact' => 'contacts#new'

  get 'contacts/create'

  get 'about' => 'about#index'

  resources 'contacts', only: [:new, :create]

  namespace :admin do
    resources :posts, :categories, :comments, :users, :sessions
  end

  resources :categories

  resources :posts do
    resources :comments
  end

end
