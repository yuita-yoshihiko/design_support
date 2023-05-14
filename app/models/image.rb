class Image
  include ActiveModel::Model

  attr_accessor :image

  validates :image, presence: true
  validate :acceptable_image

  def acceptable_image
    return unless image

    if image.size > 5.megabytes
      errors.add(:image, '※5MB以下の画像を選択してください')
    end

    unless image.content_type.in?(%('image/jpeg image/png'))
      errors.add(:image, '※条件に合う形式の画像を選択してください')
    end
  end

  def self.get_image_colors(params)
    require 'google/cloud/vision'
    image_annotator = Google::Cloud::Vision.image_annotator do |config|
      config.credentials = ENV['GOOGLE_APPLICATION_CREDENTIALS']
    end
    image_file = params[:image][:image]
    image_path = image_file.tempfile.path
    response = image_annotator.image_properties_detection(
      image: image_path,
      max_results: 5
    )
    response.responses.first.image_properties_annotation.dominant_colors.colors
  end
end
