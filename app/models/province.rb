# frozen_string_literal: true

class Province < ApplicationRecord
  has_many :addresses
end
