class HomeController < ApplicationController
  skip_before_action :require_login

  def top
    @q = DesignTip.ransack(params[:q])
    @design_tips = @q.result(distinct: true).preload(:reviews)
    @sort_design_tips = DesignTip.preload(:reviews).sort_by_average_score
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
