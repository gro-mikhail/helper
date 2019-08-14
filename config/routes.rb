# frozen_string_literal: true

Rails.application.routes.draw do
  get 'profile' => 'profiles#me'
  get 'order/:id' => 'orders#show', as: 'order'
  post 'response_to_orders' => 'response_to_orders#create', as: 'response_to_orders'
  resources :profiles
  devise_for :workers
  resources :workers
  root to: 'pages#home'
  devise_for :customers

  resources :customers do
    resources :orders do
      member do
        put 'complete'
        put 'confirm'
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
