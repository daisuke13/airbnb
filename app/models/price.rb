class Price < ApplicationRecord
  validates :price, presence: true
  validates :currency, presence: true
  validates :room_id, uniqueness: true

  belongs_to :room
end
