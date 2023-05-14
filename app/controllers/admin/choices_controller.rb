class Admin::ChoicesController < Admin::BaseController
  before_action :set_choice, only: %i[show edit update destroy]

  def index
    @choices = Choice.all
  end

  def show
  end

  def new
    @choice = Choice.new
  end

  def edit
  end

  def create
    @choice = Choice.new(choice_params)
    if @choice.save
      update_correct_attribute
      redirect_to admin_choice_url(@choice), success: t('defaults.message.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @choice.update(choice_params)
      update_correct_attribute
      redirect_to admin_choice_path(@choice), success: t('defaults.message.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @choice.destroy!
    redirect_to admin_choices_url, success: t('defaults.message.deleted'), status: :see_other
  end

  private

  def set_choice
    @choice = Choice.find(params[:id])
  end

  def choice_params
    params.require(:choice).permit(:content, :correct, :quiz_id)
  end

  def update_correct_attribute
    if params[:choice][:correct] == '1'
      @choice.update_attribute(:correct, true)
    else
      @choice.update_attribute(:correct, false)
    end
  end
end
