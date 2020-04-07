# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :status
  belongs_to :user
  has_many :orderproductlists
  has_many :products, through: :orderproductlists
  validates :order_number, :subtotal, :GST, :PST, :HST, :total, presence: true
  accepts_nested_attributes_for :orderproductlists, allow_destroy: true
  accepts_nested_attributes_for :products
  def name
    order_number
  end
end
