# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :province
  has_many :addresslists
  has_many :users, through: :addresslists
  accepts_nested_attributes_for :addresslists
  accepts_nested_attributes_for :users
  validates :street_no, :city, :apt_no, :postal_code, presence: true
  def name
    street_no + ' ' + city + ' ' + postal_code
  end
end
