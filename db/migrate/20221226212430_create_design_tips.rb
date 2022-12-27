class CreateDesignTips < ActiveRecord::Migration[7.0]
  def change
    create_table :design_tips do |t|
      t.string :title, null: false
      t.text :guidance, null: false
      t.string :url, null: false

      t.timestamps
    end
  end
end
