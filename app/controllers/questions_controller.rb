class QuestionsController < ApplicationController
  skip_before_action :require_login

  def index
  end

  def answer
    @answer_code = Answer.get_answer(params[:answer1], params[:answer2], params[:answer3])
    @answer_design_tip = AnswerDesignTip.preload(:answer, :design_tip)
  end
end
