class Admin::DesignTipsController < Admin::BaseController
  before_action :set_design_tip, only: %i[show edit update destroy]

  # GET /design_tips or /design_tips.json
  def index
    @design_tips = DesignTip.all
    @category_list=Category.all
  end

  # GET /design_tips/1 or /design_tips/1.json
  def show
    @design_tip = DesignTip.find(params[:id])
    @design_tip_categories = @design_tip.categories
  end

  # GET /design_tips/new
  def new
    @design_tip = DesignTip.new
  end

  # GET /design_tips/1/edit
  def edit
    @design_tip = DesignTip.find(params[:id])
    @category_list = @design_tip.categories.pluck(:name).join(',')
  end

  # POST /design_tips or /design_tips.json
  def create
    @design_tip = DesignTip.new(design_tip_params)
    category_list = params[:design_tip][:category].split(',')
    if @design_tip.save
      @design_tip.save_category(category_list)
      redirect_to admin_design_tip_url(@design_tip), success: t('defaults.message.created', item: DesignTip.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /design_tips/1 or /design_tips/1.json
  def update
    @design_tip = DesignTip.find(params[:id])
    category_list = params[:design_tip][:category].split(',')
    if @design_tip.update(design_tip_params)
      @design_tip.save_category(category_list)
      redirect_to admin_design_tip_path(@design_tip), success: t('defaults.message.updated', item: DesignTip.model_name.human)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /design_tips/1 or /design_tips/1.json
  def destroy
    @design_tip.destroy!
    redirect_to admin_design_tips_url, success: t('defaults.message.deleted', item: DesignTip.model_name.human, status: :see_other)
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
