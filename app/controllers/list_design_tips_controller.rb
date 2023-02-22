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
    redirect_to @design_tip
  end

  def destroy
    @list_design_tip = ListDesignTip.find(params[:id])
    @list_design_tip.destroy
    redirect_to list_design_tips_path, notice: "Item was successfully removed from list."
  end
end
