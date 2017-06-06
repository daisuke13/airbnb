class Room < ApplicationRecord
  belongs_to :user
  has_one :information
  has_one :location
  has_one :price
end
