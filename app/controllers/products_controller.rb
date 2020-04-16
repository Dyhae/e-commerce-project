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

  def session_cart
    session_cart_address
  end

  def session_cart_address
    if current_user
      @userAddresses = current_user.addresses
    else
      redirect_to new_user_session_path
      flash[:alert] = 'Must log in.'
    end
  end

  def add_to_cart
    id = params[:id].to_i
    quantity = 1
    unless session[:cart].include?(id)
      session[:cart] << { id: id, quantity_passed: quantity }
    end
    redirect_to root_path
  end

  def remove_from_cart
    puts params[:id]
    cart = session[:cart]
    cart.delete_if { |i| i['id'] == params[:id].to_i }
    redirect_back(fallback_location: root_path)
  end

  def update_quantity
    id = params[:id].to_i
    @quantity = 0
    session[:cart].each do |item|
      if item['id'] == id
        if params[:type] == 'plus'
          item['quantity_passed'] = item['quantity_passed'] + 1
          @quantity = item['quantity_passed']
        elsif params[:type] == 'minus'
          item['quantity_passed'] = item['quantity_passed'] - 1
          @quantity = item['quantity_passed']
        end
      end
    end
    puts session[:cart]
    redirect_to session_cart_path
  end
end
