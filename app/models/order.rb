# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :status
  belongs_to :user
  has_many :orderproductlists
  has_many :products, through: :orderproductlists
  accepts_nested_attributes_for :orderproductlists
  accepts_nested_attributes_for :products
  def name
    order_number
  end
end
