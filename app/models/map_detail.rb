class MapDetail < ApplicationRecord
  belongs_to :map

  validates :name, presence: true, length: { maximum: 255 }
  validates :url, presence: true
  validates :map_id, presence: true
end
