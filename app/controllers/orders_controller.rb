# frozen_string_literal: true

class OrdersController < ApplicationController
  def index; end

  def show; end

  # def createOrder
  #   order_number = rand(10_000 .. 99_999)
  #   total = @price
  #   newOrder = Order.find_or_create_by(order_number: order_number)
  #   newOrder.subtotal = @price

  #   newOrder.save
  # end
end
