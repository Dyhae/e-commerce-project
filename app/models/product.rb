# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :state
  belongs_to :category
  has_many :orderproductlists
  has_many :orders, through: :orderproductlists
  accepts_nested_attributes_for :orderproductlists, allow_destroy: true

  validates :model, :color, :transmission, :price, :quantity_in_stock, presence: true
end
