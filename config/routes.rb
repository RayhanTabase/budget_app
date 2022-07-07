Rails.application.routes.draw do
  get 'home/index'
  get 'transactions/index'
  get 'transactions/show'
  get 'transactions/new'
  get 'categories/index'
  get 'categories/show'
  get 'categories/new'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
