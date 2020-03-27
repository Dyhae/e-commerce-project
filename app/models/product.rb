# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :state
  belongs_to :category
  has_many :orderproductlists
  has_many :orders, through: :orderproductlists
end
