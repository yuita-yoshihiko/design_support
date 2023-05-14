class QuizeesController < ApplicationController
  skip_before_action :require_login

  def index
    @quizees = Quiz.all
    @choices = Choice.all
    @result = Quiz.check_answer(params)
  end
end
