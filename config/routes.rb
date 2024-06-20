Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :users, only: [:edit, :update]
  resources :items do
    resources :buyers, only: [:index, :create]
  end

  
  # Defines the root path route ("/")
  # root "articles#index"
end
