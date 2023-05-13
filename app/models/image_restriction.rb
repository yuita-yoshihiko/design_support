class ImageRestriction
  include ActiveModel::Model

  attr_accessor :image

  validates :image, presence: true
  validate :acceptable_image

  def acceptable_image
    return unless image

    if image.size > 5.megabytes
      errors.add(:image, "※5MB以下の画像を選択してください")
    end

    unless image.content_type.in?(%('image/jpeg image/png'))
      errors.add(:image, "※条件に合う形式の画像を選択してください")
    end
  end
end
