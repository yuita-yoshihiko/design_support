class AnswersController < ApplicationController
  skip_before_action :require_login

  def index
    @answer_code = Answer.get_answer(params[:answer1], params[:answer2], params[:answer3])
    @answer_design_tip = AnswerDesignTip.preload(:answer)
  end
end
