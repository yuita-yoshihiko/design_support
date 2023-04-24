class Notifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.integer :design_tip_id, null: false
      t.string :title, null: false
      t.string :url, null: false

      t.timestamps
    end
  end
end
