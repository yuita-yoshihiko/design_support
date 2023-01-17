class CreateDesignTipCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :design_tip_categories do |t|
      t.references :design_tip, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end

    add_index :design_tip_categories, [:design_tip_id, :category_id], unique: true
  end
end
