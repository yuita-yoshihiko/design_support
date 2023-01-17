class Category < ApplicationRecord
  has_many :design_tip_categories,dependent: :destroy, foreign_key: 'category_id'
  has_many :design_tips,through: :design_tip_categories

  validates :name, uniqueness: true, presence: true
end
