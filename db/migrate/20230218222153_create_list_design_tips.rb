class CreateListDesignTips < ActiveRecord::Migration[7.0]
  def change
    create_table :list_design_tips do |t|
      t.references :list, null: false, foreign_key: true
      t.references :design_tip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
