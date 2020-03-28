# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category).includes(:state).all
  end

  def show; end
end
