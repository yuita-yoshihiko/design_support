class QuizeesController < ApplicationController
  skip_before_action :require_login

  def index
    @quizees = Quiz.all
    @choices = Choice.all
    check_answer
  end

  def commentary
  end

  def check_answer
    correct = params[:correct]
    if correct == "true"
      @result = "正解！"
    elsif correct == "false"
      @result = "不正解..."
    end
  end
end
