class DesignTip < ApplicationRecord
  has_many :likes, dependent: :destroy
  acts_as_taggable
end
