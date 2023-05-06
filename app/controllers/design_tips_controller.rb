class DesignTipsController < ApplicationController
  before_action :set_q, only: %i[index search]
  before_action :set_likes, only: %i[likes]
  skip_before_action :require_login

  def index
    @search_design_tips = DesignTip.all
    @design_tips = @q.result(distinct: true).preload(:tags, :reviews)
    @tag_list = DesignTip.tag_counts_on(:tags).most_used(20)
    @review = Review.new
    @user = User.new
  end

  def show
    @design_tip = DesignTip.find(params[:id])
    @review = Review.new
  end

  def search
    @search_design_tips = DesignTip.all.preload(:reviews)
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
