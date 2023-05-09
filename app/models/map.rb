class Map < ApplicationRecord
  has_many :map_details, dependent: :destroy
end
