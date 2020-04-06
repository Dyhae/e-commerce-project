# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :initialize_session
  before_action :increment_visit_count, only: %i[index show]
  before_action :load_cart
  
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
    @cart = Product.find(session[:cart])
  end

  def increment_visit_count
    session[:visit_count] += 1 # Increment the count of the visit count
    @visit_count = session[:visit_count]
  end
end
