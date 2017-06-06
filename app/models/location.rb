class Location < ApplicationRecord
  validates :postal_code, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :building, presence: true

  belongs_to :room
end
