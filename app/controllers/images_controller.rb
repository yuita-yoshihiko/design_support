class ImagesController < ApplicationController
  skip_before_action :require_login

  def index
    query = params[:query]
    @images = PixabayApi.search_images(query)
  end

  def search
    query = params[:query]
    @images = PixabayApi.search_images(query)
  end
end