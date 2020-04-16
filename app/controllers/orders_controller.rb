# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @allOrders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def getTheAddress_Province
    @getTheAddress_Province = Address.find(params[:id]).province
    createOrder
    emptyTheSession
    redirect_to root_path
  end

  def createOrder
    order_number = rand(1..99_999)
    newOrder = Order.find_or_create_by(order_number: order_number)
    newOrder.subtotal = @price
    newOrder.GST = @getTheAddress_Province.GST_rate
    newOrder.PST = @getTheAddress_Province.PST_rate
    newOrder.HST = @getTheAddress_Province.HST_rate
    total = @price * (1 + (@getTheAddress_Province.GST_rate / 100 +
    @getTheAddress_Province.PST_rate / 100 + @getTheAddress_Province.HST_rate / 100))
    newOrder.total = total
    newOrder.status_id = Status.find_by(name: 'unpaid').id
    newOrder.user_id = current_user.id
    newOrder.save

    @cart.each do |item_cart|
      session[:cart].each do |item|
        next unless item_cart.id == item['id'].to_i

        newOrderList = Orderproductlist.create
        newOrderList.price = item_cart.price * item['quantity_passed'].to_i
        newOrderList.quantity = item['quantity_passed'].to_i
        newOrderList.order_id = newOrder.id
        newOrderList.product_id = item_cart.id
        newOrderList.save
      end
    end
  end
end
