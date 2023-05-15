class MapsController < ApplicationController
  skip_before_action :require_login

  def index
    gon.maps = Map.all
    @maps = Map.all
    @map_details = MapDetail.all
  end
end
