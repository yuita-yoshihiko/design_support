class Admin::MapsController < Admin::BaseController
  before_action :set_map, only: %i[show edit update destroy]

  def index
    @maps = Map.all
  end

  def show
  end

  def new
    @map = Map.new
  end

  def edit
  end

  def create
    @map = Map.new(map_params)
    if @map.save
      redirect_to admin_map_url(@map), success: t('defaults.message.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @map.update(map_params)
      redirect_to admin_map_path(@map), success: t('defaults.message.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @map.destroy!
    redirect_to admin_maps_url, success: t('defaults.message.deleted'), status: :see_other
  end

  private

  def set_map
    @map = Map.find(params[:id])
  end

  def map_params
    params.require(:map).permit(:name, :latitude, :longitude)
  end
end
