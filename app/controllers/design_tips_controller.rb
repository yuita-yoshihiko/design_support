class DesignTipsController < ApplicationController
  before_action :set_q
  skip_before_action :require_login

  def index
    @search = DesignTip.ransack(params[:q])
    @design_tips = @search.result(distinct: true)
    @tag_list = DesignTip.tag_counts_on(:tags).most_used(20)
  end

  def search
    @results = @q.result
    @tag_list = DesignTip.tag_counts_on(:tags).most_used(20)
  end

  def likes
    @like_design_tips = current_user.like_design_tips.includes(:user).order(created_at: :desc)
  end

  private

  def set_q
    @q = DesignTip.ransack(params[:q])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_design_tip
    @design_tip = DesignTip.find(params[:id])
  end
end
