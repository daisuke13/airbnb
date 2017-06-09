class Location < ApplicationRecord
  validates :country, presence: true
  validates :postal_code, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :room_id, uniqueness: true

  belongs_to :room
end
