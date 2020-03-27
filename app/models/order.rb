class Order < ApplicationRecord
  belongs_to :status
  belongs_to :user
  has_many :orderproductlists
  has_many :products, through: :orderproductlists
end
