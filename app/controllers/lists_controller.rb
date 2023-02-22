class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = current_user.lists
    @list = List.new
    @list_design_tip = @list.design_tips
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.build(list_params)

    if @list.save
      redirect_to lists_url, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  def show
    @design_tips = @list.design_tips
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to @list, notice: 'List was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to list_design_tips_path, notice: 'List was successfully destroyed.'
  end

  private
    def set_list
      @list = current_user.lists.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:name)
    end
end
