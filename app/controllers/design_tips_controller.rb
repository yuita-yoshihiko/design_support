class DesignTipsController < ApplicationController
  before_action :set_q
  skip_before_action :require_login

  def index
    @design_tips = @q.result(distinct: true).preload(:tags)
    @tag_list = DesignTip.tag_counts_on(:tags).most_used(20)
    @list = List.new
    return unless current_user

    @lists = current_user.lists
  end

  def search
    @results = @q.result
    @tag_list = DesignTip.tag_counts_on(:tags).most_used(20)
  end

  def likes
    @like_design_tips = current_user.like_design_tips.order(created_at: :desc)
    @list = List.new
    return unless current_user

    @lists = current_user.lists
  end

  private

  def set_q
    @q = DesignTip.ransack(params[:q])
  end
end
