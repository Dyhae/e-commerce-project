# frozen_string_literal: true

Rails.application.routes.draw do
  get 'states/index'
  get 'states/show'
  get 'categories/index'
  get 'categories/show'
  # get 'products/index'
  # get 'products/show'
  # get 'prducts/index'
  # get 'prducts/show'

  root to: 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
