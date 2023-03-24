class QuestionsController < ApplicationController
  skip_before_action :require_login

  def index
  end

  def answer
    @answer1 = params[:answer1]
    @answer2 = params[:answer2]
    @answer3 = params[:answer3]
    
    @answer_code = Answer.get_answer(@answer1, @answer2, @answer3)
  end
end
