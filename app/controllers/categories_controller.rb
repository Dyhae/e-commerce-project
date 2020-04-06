# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category_products = Category.find(params[:id]).products
  end

  def search_results_category
    @search_results_category = Category.find(params[:id]).products.where('model LIKE ?', "%#{params[:search_term]}%")
  end
end
