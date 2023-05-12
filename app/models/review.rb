class Review < ApplicationRecord
  belongs_to :user
  belongs_to :design_tip

  validates :user_id, uniqueness: { scope: :design_tip_id }
end
