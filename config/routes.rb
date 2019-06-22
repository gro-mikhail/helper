Rails.application.routes.draw do
  devise_for :workers
  resources :workers
  root to: "pages#home"	
  devise_for :customers
  resources :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
