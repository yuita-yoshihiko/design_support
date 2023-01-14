class HomeController < ApplicationController
  skip_before_action :require_login

  def top
    @q = DesignTip.ransack(params[:q])
    @design_tips = @q.result(distinct: true)
  end

  def for_beginner
  end

  def privacy_policy
  end

end
