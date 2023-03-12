class List < ApplicationRecord
  belongs_to :user
  has_many :list_design_tips, dependent: :destroy
  has_many :design_tips, through: :list_design_tips

  validates :name, presence: true, uniqueness: { scope: :user_id }, length: { maximum: 65_535 }
end
