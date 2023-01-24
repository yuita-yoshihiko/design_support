class AddMediaToDesignTips < ActiveRecord::Migration[7.0]
  def change
    add_column :design_tips, :media, :integer, null: false, default: 0
  end
end
