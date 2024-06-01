Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  
  resource :items
  # Defines the root path route ("/")
  # root "articles#index"
end
