class DesignTipsController < ApplicationController
  before_action :set_q
  before_action :set_likes, only: %i[likes]
  skip_before_action :require_login

  def index
    @design_tips = @q.result(distinct: true).preload(:tags)
    @tag_list = DesignTip.tag_counts_on(:tags).most_used(20)
  end

  def search
    @results = @q.result
    @tag_list = DesignTip.tag_counts_on(:tags).most_used(20)
  end

  def likes
    @list = List.new
  end

  private

  def set_q
    @q = DesignTip.ransack(params[:q])
  end

  def set_likes
    return unless current_user
    @like_design_tips = current_user.like_design_tips.order(created_at: :desc)
    @lists = current_user.lists
  end
end
