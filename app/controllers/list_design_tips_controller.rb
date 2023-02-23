class ListDesignTipsController < ApplicationController

  def index
    @lists = current_user.lists
    @list_design_tips = ListDesignTip.all.includes(:list, :design_tip)
    @list = List.new
    @design_tips = DesignTip.all
  end

  def create
    @list = List.find(params[:list_id])
    @design_tip = DesignTip.find(params[:design_tip_id])
    @list.design_tips << @design_tip
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
