class Admin::MapDetailsController < Admin::BaseController
  before_action :set_map_detail, only: %i[show edit update destroy]

  def index
    @map_details = MapDetail.all
  end

  def show
  end

  def new
    @map_detail = MapDetail.new
  end

  def edit
  end

  def create
    @map_detail = MapDetail.new(map_detail_params)
    if @map_detail.save
      redirect_to admin_map_detail_url(@map_detail), success: t('defaults.message.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @map_detail.update(map_detail_params)
      redirect_to admin_map_detail_path(@map_detail), success: t('defaults.message.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @map_detail.destroy!
    redirect_to admin_map_details_url, success: t('defaults.message.deleted'), status: :see_other
  end

  private

  def set_map_detail
    @map_detail = MapDetail.find(params[:id])
  end

  def map_detail_params
    params.require(:map_detail).permit(:name, :url, :image, :map_id)
  end
end