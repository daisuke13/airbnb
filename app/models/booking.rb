class Booking < ApplicationRecord
  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :guest, presence: true

  belongs_to :user
  belongs_to :room
end
