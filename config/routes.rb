Rails.application.routes.draw do
  devise_for :users

  resources :categories, only: [:index, :new, :create] do
    resources :transactions, only: [:index, :show, :new, :create]
  end

  root "home#index"
end
