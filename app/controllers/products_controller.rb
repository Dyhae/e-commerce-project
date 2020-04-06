# frozen_string_literal: true

class ProductsController < ApplicationController
  # before_action :initialize_session
  # before_action :increment_visit_count, only: %i[index show]
  # before_action :load_cart

  def index
    @products = Product.includes(:category).includes(:state).page params[:page]
  end

  def show
    @product = Product.find(params[:id])
  end

  def search_results
    @product_search = Product.where('model LIKE ?', "%#{params[:search_term]}%")
  end

  def add_to_cart
    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    redirect_to root_path
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to root_path
  end


end
