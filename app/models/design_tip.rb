class DesignTip < ApplicationRecord
  belongs_to :user
  acts_as_taggable_on :tags
  has_many :likes, dependent: :destroy
  has_many :list_design_tips, dependent: :destroy
  has_many :lists, through: :list_design_tips
  has_many :answers, through: :answert_design_tips
  has_many :reviews, dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
  validates :guidance, presence: true, length: { maximum: 65_535 }
  validates :url, presence: true

  enum medium: { web: 0, book: 1, movie: 2 }

  def average_score(design_tip_id)
    unless self.reviews.empty?
      reviews.average(:score).to_f.round(1)
    else
      0.0
    end
  end

  def average_score_percentage(design_tip_id)
    unless self.reviews.empty?
      reviews.average(:score).to_f.round(1) * 20
    else
      0.0
    end
  end

  def self.sort_by_average_score
    DesignTip.all.sort_by { |tip| -tip.average_score(tip.id) }
  end

end
