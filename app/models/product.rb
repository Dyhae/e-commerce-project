class Product < ApplicationRecord
  belongs_to :state
  belongs_to :category
end
