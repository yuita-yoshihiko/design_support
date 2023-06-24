class Review < ApplicationRecord
  belongs_to :user
  belongs_to :design_tip

  validates :user_id, uniqueness: { scope: :design_tip_id }
  validates :user_id, presence: true
  validates :design_tip_id, presence: true
  validates :score, presence: true
end
