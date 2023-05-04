class ImagesController < ApplicationController
  skip_before_action :require_login

  def index
    @query = params[:query]
    @images = PixabayApi.search_images(@query)
  end

  def create
    image_file = params[:image]
    image_path = image_file.tempfile.path
    @colors = get_image_colors(image_path)
    query = params[:query]
    @images = PixabayApi.search_images(query)
    render :index
  end

  private

  def get_image_colors(image_path)
    require "google/cloud/vision"
    image_annotator  = Google::Cloud::Vision.image_annotator do | config |
      config.credentials = ENV['GOOGLE_APPLICATION_CREDENTIALS']
    end
    response = image_annotator.image_properties_detection(
      image: image_path,
      max_results: 5
    )
    response.responses.first.image_properties_annotation.dominant_colors.colors
  end
end
