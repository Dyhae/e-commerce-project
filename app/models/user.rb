class User < ApplicationRecord
  has_many :orders
  has_many :addresslists
  has_many :addresses, through: :addresslists
end
