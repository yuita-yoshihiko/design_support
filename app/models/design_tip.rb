class DesignTip < ApplicationRecord

  belongs_to :user
  acts_as_taggable_on :tags
  has_many :likes, dependent: :destroy
  has_many :list_design_tips
  has_many :lists, through: :list_design_tips

  enum medium: { web: 0, book: 1, movie: 2 }
end
