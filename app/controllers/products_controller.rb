# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category).includes(:state)
    # @products_page = Product.paginate(page: params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  def search_results
    @product_search = Product.where('model LIKE ?', "%#{params[:search_term]}%")
  end
end
