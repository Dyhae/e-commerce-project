# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :state
  belongs_to :category
  has_many :orderproductlists
  has_many :orders, through: :orderproductlists
  accepts_nested_attributes_for :orderproductlists
  accepts_nested_attributes_for :orders
  has_many_attached :image

  validates :model, :color, :transmission, :price, :quantity_in_stock, presence: true

  def name
    model
  end
end
