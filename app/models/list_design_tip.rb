class ListDesignTip < ApplicationRecord
  belongs_to :list
  belongs_to :design_tip

  validates :design_tip_id, uniqueness: { scope: :list_id }
end
