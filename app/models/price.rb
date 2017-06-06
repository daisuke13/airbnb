class Price < ApplicationRecord
  validates :price, presence: true
  validates :currency, presence: true

  belongs_to :room
end
