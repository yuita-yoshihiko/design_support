class ListDesignTipsController < ApplicationController
  def index
    @list = List.new
    @list_design_tips = ListDesignTip.includes(:list, :design_tip, :tags)
    @lists = current_user.lists.includes(list_design_tips: :design_tip)
  end

  def create
    @list = List.find(params[:list_id])
    @design_tip = DesignTip.find(params[:design_tip_id])
    if @list.design_tips.include?(@design_tip)
      flash.now[:error] = 'その情報は既にリストに登録されています'
      render :error, status: :unprocessable_entity
    else
      @list.design_tips << @design_tip
      if @list.save
        redirect_to list_design_tips_path, flash: { success: 'リストに情報を追加しました。' }
      else
        flash.now[:error] = '情報を追加できませんでした。'
        render :index, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @list_design_tip = ListDesignTip.find(params[:id])
    @list_design_tip.destroy
    redirect_to list_design_tips_path, success: 'リストから情報を削除しました。'
  end
end
