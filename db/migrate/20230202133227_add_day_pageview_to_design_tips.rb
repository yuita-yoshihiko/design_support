class AddDayPageviewToDesignTips < ActiveRecord::Migration[7.0]
  def change
    add_column :design_tips, :day_pageview, :integer, null: false, default: 0
  end
end
