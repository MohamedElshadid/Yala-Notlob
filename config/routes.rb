Rails.application.routes.draw do
  get 'home/index'
  # get 'status'
  get 'orders/status'

  resources :order_details
  resources :friendships
  resources :orders
  resources :groups
  # get 'new', to: 'orders#new'
  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth'
  }
  as :user do
  	# Customize root for user 
  	get "signin" => 'devise/sessions#new'
  	delete "signout" => 'devise/sessions#destroy'
    get 'signup' => 'devise/registrations#new'
   
  end
  root 'home#index'
  post 'password/forgot', to: 'password#forgot'
  post 'password/reset', to: 'password#reset'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
