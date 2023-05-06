class HomeController < ApplicationController
  skip_before_action :require_login
  before_action :set_q, only: :top

  def top
    @search_design_tips = DesignTip.all
    @tag_list = DesignTip.tag_counts_on(:tags).most_used(20)
    @sort_design_tips = DesignTip.preload(:reviews).sort_by_average_score
    # @search_design_tips.each do |design_tip|
    #   @thumbnail = YoutubeApi.get_thumbnail(design_tip)
    # end
    return unless current_user
    @recommend_design_tips = DesignTip.recommended_for(current_user)

    @answer_code = Answer.get_answer(params[:answer1], params[:answer2], params[:answer3])
    @answer_design_tip = AnswerDesignTip.preload(:answer)
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
