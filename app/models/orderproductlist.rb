# frozen_string_literal: true

class Orderproductlist < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :price, :quantity, presence: true
end
