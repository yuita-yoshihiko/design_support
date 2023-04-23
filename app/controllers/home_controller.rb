class HomeController < ApplicationController
  skip_before_action :require_login

  def top
    @q = DesignTip.ransack(params[:q])
    @design_tips = @q.result(distinct: true).preload(:reviews)
    @sort_design_tips = DesignTip.preload(:reviews).sort_by_average_score
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
end
