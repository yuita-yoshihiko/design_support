class ReviewsController < ApplicationController
  def index
    @design_tip_ids = DesignTip.pluck(:id)
    @average_scores = {}
    @design_tip_ids.each do |design_tip_id|
      @average_scores[design_tip_id] = Review.average_score_by_design_tip_id(design_tip_id)
    end
  end

  def create
    @review = Review.find_or_initialize_by(user_id: current_user.id, design_tip_id: review_params[:design_tip_id])
    @review.score = review_params[:score]
    if @review.save
      redirect_to request.referer, success: '評価を登録しました。'
    else
      @design_tip = DesignTip.find(params[:id])
      render 'design_tips/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:design_tip_id, :score)
  end
end
