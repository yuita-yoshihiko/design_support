class DesignTip < ApplicationRecord

  belongs_to :user
  has_many :likes, dependent: :destroy
  acts_as_taggable

  enum medium: { web: 0, book: 1, movie: 2 }
end
