class MapsController < ApplicationController
  skip_before_action :require_login

  def index
    gon.maps = Map.all
  end

  def show
    @map = Map.find(params[:id])
    @map_details = @map.map_details
  end
end
