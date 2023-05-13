class ImagesController < ApplicationController
  skip_before_action :require_login

  def index
    @query = params[:query]
    @images = PixabayApi.search_images(@query)
    new
  end

  def create
    @image_restriction = ImageRestriction.new(image: params[:image_restriction][:image])
    if @image_restriction.valid?
      image_file = params[:image_restriction][:image]
      image_path = image_file.tempfile.path
      @colors = get_image_colors(image_path)
      query = params[:query]
      @images = PixabayApi.search_images(query)
      render :index
    else
      render :index
    end
  end

  def new
    @image_restriction = ImageRestriction.new
  end

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
