class DesignTipsController < ApplicationController
  before_action :set_q, only: %i[index search]
  before_action :set_likes, only: %i[likes]
  before_action :set_tag_list, only: %i[index search]
  skip_before_action :require_login

  def index
    @design_tips = @q.result(distinct: true).preload(:tags, :reviews)
    @review = Review.new
    @user = User.new
  end

  def search
    @results = @q.result
  end

  def likes
    @list = List.new
  end

  private

  def set_q
    @q = DesignTip.ransack(params[:q])
    @search_design_tips = DesignTip.all
  end

  def set_tag_list
    @tag_list = DesignTip.tag_counts_on(:tags).most_used(20)
  end

  def set_likes
    return unless current_user
    @like_design_tips = current_user.like_design_tips.order(created_at: :desc).preload(:reviews)
    @lists = current_user.lists
  end
end
