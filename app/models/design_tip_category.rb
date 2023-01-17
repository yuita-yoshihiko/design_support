class DesignTipCategory < ApplicationRecord
  belongs_to :design_tip
  belongs_to :category
  validates :design_tip_id, presence: true
  validates :category_id, presence: true
end
