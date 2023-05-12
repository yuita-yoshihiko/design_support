class RemoveDayPageviewFromDesignTips < ActiveRecord::Migration[7.0]
  def change
    remove_column :design_tips, :day_pageview, :integer
  end
end
