class ImagesController < ApplicationController
  skip_before_action :require_login

  def index
    search_images
    new
  end

  def create
    @image_restriction = Image.new(image: params[:image][:image])
    if @image_restriction.valid?
      @colors = Image.get_image_colors(params)
      search_images
    end
    render :index
  end

  private

  def search_images
    @query = params[:query]
    @images = PixabayApi.search_images(@query)
  end

  def new
    @image_restriction = Image.new
  end
end
