class Room < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_one :information
  has_one :location
  has_one :price
  has_many :bookings
  has_many :restaurants
end
