class Addresslist < ApplicationRecord
  belongs_to :user
  belongs_to :address
end
