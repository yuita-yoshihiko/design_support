class HomeController < ApplicationController
  skip_before_action :require_login
  before_action :set_q, only: :top
  before_action :set_tag_list, only: :top
  before_action :ask, only: :top

  def top
    @sort_design_tips = DesignTip.preload(:reviews).sort_by_average_score
    @user = User.new
    @review = Review.new
    return unless current_user

    @recommend_design_tips = DesignTip.recommended_for(current_user)
  end

  def privacy_policy
  end

  def terms_of_use
  end

  private

  def set_q
    @q = DesignTip.ransack(params[:q])
    @search_design_tips = DesignTip.all
  end

  def set_tag_list
    @tag_list = DesignTip.tag_counts_on(:tags).most_used(20)
  end

  def ask
    @asks = Ask.includes(:responses)
    @answer_design_tip = AnswerDesignTip.preload(:answer)
    @answer_code = Ask.create_response(params)
  end
end
