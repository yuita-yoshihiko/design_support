class DesignTip < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :design_tip_categories,dependent: :destroy
  has_many :categories,through: :design_tip_categories

  def save_category(sent_categories)
    current_categories = self.categories.pluck(:name) unless self.categories.nil?
    old_categories = current_categories - sent_categories
    new_categories = sent_categories - current_categories

    old_categories.each do |old|
      self.categories.delete Category.find_by(name: old)
    end

    new_categories.each do |new|
      new_design_tip_category = Category.find_or_create_by(name: new)
      self.categories << new_design_tip_category
    end
  end
end
