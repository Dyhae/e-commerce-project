# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :province
  has_many :addresslists
  has_many :users, through: :addresslists
  accepts_nested_attributes_for :addresslists
  accepts_nested_attributes_for :users

  def name
    street_no + ' ' + city + ' ' + postal_code
  end
end
