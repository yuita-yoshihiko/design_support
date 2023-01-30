class AddUserIdToDesignTips < ActiveRecord::Migration[7.0]
  def change
    add_column :design_tips, :user_id, :integer
  end
end
