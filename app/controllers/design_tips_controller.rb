class DesignTipsController < ApplicationController
  before_action :set_design_tip, only: %i[ show edit update destroy ]
  before_action :set_q, only: [:index, :search]

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

    respond_to do |format|
      if @design_tip.save
        format.html { redirect_to design_tip_url(@design_tip), notice: "Design tip was successfully created." }
        format.json { render :show, status: :created, location: @design_tip }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @design_tip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /design_tips/1 or /design_tips/1.json
  def update
    respond_to do |format|
      if @design_tip.update(design_tip_params)
        format.html { redirect_to design_tip_url(@design_tip), notice: "Design tip was successfully updated." }
        format.json { render :show, status: :ok, location: @design_tip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @design_tip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /design_tips/1 or /design_tips/1.json
  def destroy
    @design_tip.destroy

    respond_to do |format|
      format.html { redirect_to design_tips_url, notice: "Design tip was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
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
