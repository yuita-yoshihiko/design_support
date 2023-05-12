class MapDetail < ApplicationRecord
  belongs_to :map

  validates :map_id, presence: true
  validates :content, presence: true, length: { maximum: 65_535 }
  validates :url, presence: true
end
