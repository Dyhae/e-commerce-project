# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :initialize_session
  before_action :increment_visit_count, only: %i[index show]
  before_action :load_cart
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  def application
    @application_category = Category.all
  end

  def show_category
    @category = Category.find_by(params[:id])
  end

  private

  def initialize_session
    session[:visit_count] ||= 0 # initialize the visit count on first
    session[:cart] ||= []
  end

  def load_cart
    ids = []
    product_id_quantity = {}
    session[:cart].each do |item|
      ids << item['id'].to_i
    end
    @cart = Product.find(ids)
    @price = 0
    @cart.each do |item_cart|
      session[:cart].each do |item|
        if item_cart.id == item['id'].to_i
          @price += (item_cart.price * item['quantity_passed'].to_i)
        end
      end
    end
  end

  def increment_visit_count
    session[:visit_count] += 1 # Increment the count of the visit count
    @visit_count = session[:visit_count]
  end

  def emptyTheSession
    session[:visit_count] = 0 # initialize the visit count on first
    session[:cart] = []
  end
end
