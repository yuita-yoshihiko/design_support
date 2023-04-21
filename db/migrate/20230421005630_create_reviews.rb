class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :design_tip, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
