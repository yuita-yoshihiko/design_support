class HomeController < ApplicationController
  def top
    @q = DesignTip.ransack(params[:q])
    @design_tips = @q.result(distinct: true)
  end

  def for_beginner
  end
end
