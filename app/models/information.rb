class Information < ApplicationRecord
  validates :room_type, presence: true
  validates :room_category, presence: true
  validates :acceptance_number, presence: true
  validates :bedrooms, presence: true
  validates :beds, presence: true
  validates :bathrooms, presence: true

  belongs_to :room
end
