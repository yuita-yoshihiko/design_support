class LikesController < ApplicationController
  def create
    @design_tip = DesignTip.find(params[:design_tip_id])
    current_user.like(@design_tip)
  end

  def destroy
    @design_tip = current_user.likes.find(params[:id]).design_tip
    current_user.unlike(@design_tip)
  end
end
