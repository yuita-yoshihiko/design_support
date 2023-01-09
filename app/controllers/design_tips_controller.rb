class DesignTipsController < ApplicationController
  before_action :set_design_tip, only: %i[update]
  before_action :set_q, only: [:search]
  skip_before_action :require_login

  def create
    @design_tip = DesignTip.new(design_tip_params)

    if @design_tip.save
      redirect_to admin_design_tip_url(@design_tip), success: t('defaults.message.created', item: DesignTip.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @design_tip.update(design_tip_params)
      redirect_to admin_design_tip_path(@design_tip), success: t('defaults.message.updated', item: DesignTip.model_name.human)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = DesignTip.ransack(params[:q])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_design_tip
    @design_tip = DesignTip.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def design_tip_params
    params.require(:design_tip).permit(:title, :guidance, :url)
  end
end
