class DesignTip < ApplicationRecord

  belongs_to :user
  acts_as_taggable_on :tags
  has_many :likes, dependent: :destroy

  enum medium: { web: 0, book: 1, movie: 2 }
end
