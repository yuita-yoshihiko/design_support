class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :likes, dependent: :destroy
  has_many :like_design_tips, through: :likes, source: :design_tip

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true

  enum role: { general: 0, admin: 1 }

  def own?(object)
    id == object.user_id
  end

  def like(design_tip)
    like_design_tips << design_tip
  end

  def unlike(design_tip)
    like_design_tips.destroy(design_tip)
  end

  def like?(design_tip)
    like_design_tips.include?(design_tip)
  end
end
