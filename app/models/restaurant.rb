class Restaurant < ApplicationRecord
  validates :name, presence: true
  validates :image, presence: true
  validates :url, presence: true

  belongs_to :room
end
