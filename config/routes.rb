Rails.application.routes.draw do
  get 'profile'	=> 'profiles#me'
  resources :profiles	
  devise_for :workers
  resources :workers
  root to: "pages#home"	
  devise_for :customers 
  resources :orders

  resources :customers do
  	resources :orders
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
