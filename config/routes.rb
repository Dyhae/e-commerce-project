# frozen_string_literal: true

Rails.application.routes.draw do
  resources :pages
  get 'addresses/index'
  get 'addresses/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'states/index'
  get 'states/show'
  get 'categories/index'
  get 'categories/show'
  # get 'products/index'
  # get 'products/show'
  # get 'prducts/index'
  # get 'prducts/show'

  root to: 'products#index'
  resources 'categories', only: %i[index show]
  resources 'states', only: %i[index show]
  resources 'addresses', only: %i[index show]
  resources 'products', only: %i[index show]
  devise_for :users
  resources :pages

  get '/u/home', to: 'users#home', as: 'user_home'
  get '/p/:permalink', to: 'pages#permalink', as: 'permalink'
  get '/s/:name', to: 'states#getState', as: 'states_name'
  get '/search/', to: 'products#search_results', as: 'search' # search_path
  get '/categories/:id/search/', to: 'categories#search_results_category', as: 'categories_id_search' # search_path
  get 'session_cart', to: 'products#session_cart'

  post 'products/add_to_cart', to: 'products#add_to_cart', as: 'add_to_cart'
  post 'products/update_quantity', to: 'products#update_quantity', as: 'update_quantity'
  delete 'products/remove_from_cart/:id', to: 'products#remove_from_cart', as: 'remove_from_cart'
  get 'addresses/a/new', to: 'addresses#new', as: 'addresses_new'
  post 'addresses/a/created', to: 'addresses#create', as: 'addresses_create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
