class Admin::DesignTipsController < Admin::BaseController
  before_action :set_design_tip, only: %i[show edit update destroy]

  # GET /design_tips or /design_tips.json
  def index
    @design_tips = DesignTip.all
  end

  # GET /design_tips/1 or /design_tips/1.json
  def show
  end

  # GET /design_tips/new
  def new
    @design_tip = DesignTip.new
  end

  # GET /design_tips/1/edit
  def edit
  end

  # POST /design_tips or /design_tips.json
  def create
    @design_tip = DesignTip.new(design_tip_params)

    if @design_tip.save
      redirect_to admin_design_tip_url(@design_tip), notice: 'Design tip was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /design_tips/1 or /design_tips/1.json
  def update
    if @design_tip.update(design_tip_params)
      redirect_to admin_design_tip_path(@design_tip), notice: 'Design tip was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /design_tips/1 or /design_tips/1.json
  def destroy
    @design_tip.destroy!
    redirect_to admin_design_tips_url, notice: 'Design tip was successfully destroyed.', status: :see_other
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
