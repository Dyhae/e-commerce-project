class Address < ApplicationRecord
  belongs_to :province
  has_many :addresslists
  has_many :users, through: :addresslists
end
