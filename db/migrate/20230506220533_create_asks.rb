class CreateAsks < ActiveRecord::Migration[7.0]
  def change
    create_table :asks do |t|
      t.string :ask_detail, null: false

      t.timestamps
    end
  end
end
