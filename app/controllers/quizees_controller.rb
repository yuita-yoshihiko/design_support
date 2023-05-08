class QuizeesController < ApplicationController
  skip_before_action :require_login

  def index
    @quizees = Quiz.all
    @choices = Choice.all
    check_answer
  end

  def check_answer
    correct = params[:correct]
    if correct == "true"
      @result = "正解です！"
    elsif correct == "false"
      @result = "残念、不正解です..."
    end
  end
end
