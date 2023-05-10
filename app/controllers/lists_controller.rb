class ListsController < ApplicationController
  before_action :set_list, only: %i[edit update destroy]

  def new
    @list = List.new
  end

  def edit
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      redirect_to request.referer, success: 'リストを作成しました。'
    else
      flash[:error] = 'リストを作成できませんでした。'
      redirect_to request.referer
    end
  end

  def update
    if @list.update(list_params)
      redirect_to list_design_tips_path, success: 'リスト名を変更しました。'
    else
      flash[:error] = 'リスト名を変更できませんでした。'
      redirect_to request.referer
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
