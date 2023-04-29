class HomeController < ApplicationController
  skip_before_action :require_login
  before_action :set_q, only: :top

  def top
    @search_design_tips = DesignTip.all
    @sort_design_tips = DesignTip.preload(:reviews).sort_by_average_score
    # @search_design_tips.each do |design_tip|
    #   @thumbnail = YoutubeApi.get_thumbnail(design_tip)
    # end
    return unless current_user
    @recommend_design_tips = DesignTip.recommended_for(current_user)
  end

  def for_beginner
  end

  def growing
  end

  def privacy_policy
  end

  def terms_of_use
  end

  def operation
  end

  private

  def set_q
    @q = DesignTip.ransack(params[:q])
  end
end
