class Admin::QuizeesController < Admin::BaseController
  before_action :set_quiz, only: %i[show edit update destroy]

  def index
    @quizees = Quiz.all
  end

  def show
  end

  def new
    @quiz = Quiz.new
  end

  def edit
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to admin_quizee_url(@quiz), success: t('defaults.message.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @quiz.update(quiz_params)
      redirect_to admin_quizee_path(@quiz), success: t('defaults.message.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quiz.destroy!
    redirect_to admin_quizees_url, success: t('defaults.message.deleted'), status: :see_other
  end

  private

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(:question, :commentary)
  end
end