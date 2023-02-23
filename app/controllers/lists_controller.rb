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
      redirect_to list_design_tips_path, success: 'リストを作成しました。'
    else
      flash.now[:error] = 'リストを作成できませんでした。'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @design_tips = @list.design_tips
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to @list, success: 'リスト名を変更しました。'
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to list_design_tips_path, success: 'リストを削除しました。'
  end

  private
    def set_list
      @list = current_user.lists.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:name)
    end
end
