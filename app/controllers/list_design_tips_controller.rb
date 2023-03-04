class ListDesignTipsController < ApplicationController

  def index
    @list_design_tips = ListDesignTip.includes(:list, :desing_tip, :tags)
    @lists = current_user.lists.includes(:list_design_tips)
  end

  def create
    @list = List.find(params[:list_id])
    @design_tip = DesignTip.find(params[:design_tip_id])
    begin
      @list.design_tips << @design_tip
    rescue => e
      flash.now[:error] = "その情報は既にリストに登録されています"
      render :error, status: :unprocessable_entity
      return
    end
    if @list.save
      redirect_to list_design_tips_path, success: "リストに情報を追加しました。"
    else
      flash.now[:error] = "情報を追加できませんでした。"
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @list_design_tip = ListDesignTip.find(params[:id])
    @list_design_tip.destroy
    redirect_to list_design_tips_path, success: "リストから情報を削除しました。"
  end
end
