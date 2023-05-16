class DesignTip < ApplicationRecord
  belongs_to :user
  acts_as_taggable_on :tags
  has_many :likes, dependent: :destroy
  has_many :list_design_tips, dependent: :destroy
  has_many :lists, through: :list_design_tips
  has_many :answers, through: :answert_design_tips
  has_many :reviews, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
  validates :guidance, presence: true, length: { maximum: 65_535 }
  validates :url, presence: true

  enum medium: { web: 0, book: 1, movie: 2 }

  def average_score(design_tip_id, percentage: false)
    unless self.reviews.empty?
      score = reviews.average(:score).to_f.round(1)
      percentage ? score * 20 : score
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

  def self.recommended_for(user)
    design_tip_ids = user.likes.pluck(:design_tip_id)
    tag_names = ActsAsTaggableOn::Tag.joins(:taggings).where(taggings: { taggable_type: 'DesignTip', taggable_id: design_tip_ids }).pluck(:name)
    DesignTip.tagged_with(tag_names, any: true).where.not(id: design_tip_ids).distinct
  end

  def self.create_notification(design_tip)
    Notification.create(design_tip_id: design_tip.id, title: design_tip.title, url: design_tip.url)
  end
end
