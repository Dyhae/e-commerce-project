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

  resources :pages

  get '/p/:permalink', to: 'pages#permalink', as: 'permalink'
  get '/s/:name', to: 'states#getState', as: 'states_name'
  get '/search/', to: 'products#search_results', as: 'search' # search_path
  get '/categories/:id/search/', to: 'categories#search_results_category', as: 'categories_id_search' # search_path

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
