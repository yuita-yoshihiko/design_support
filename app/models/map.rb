class Map < ApplicationRecord
  has_many :map_details, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :latitude, presence: true
  validates :longitude, presence: true
end
