# frozen_string_literal: true

Rails.application.routes.draw do
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
  resources 'addresses', only: %i[index show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
