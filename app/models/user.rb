# frozen_string_literal: true

class User < ApplicationRecord
  has_many :orders
  has_many :addresslists
  has_many :addresses, through: :addresslists
  accepts_nested_attributes_for :addresslists
  accepts_nested_attributes_for :addresses
  has_one_attached :avatar
  def name
    self.alias
  end
end
