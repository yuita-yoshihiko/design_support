class CreateMapDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :map_details do |t|
      t.references :map, null: false, foreign_key: true
      t.string :name, null: false
      t.string :url, null: false
      t.string :image      

      t.timestamps
    end
  end
end
