Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :categories, only: [:index, :new, :create] do
    resources :transactions, only: [:index, :show, :new, :create]
  end

  root "home#index"
end
