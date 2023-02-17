class CreateCheckLists < ActiveRecord::Migration[7.0]
  def change
    create_table :check_lists do |t|
      t.references :check, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
