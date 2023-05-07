class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.string :content, null: false
      t.string :is_answer, null: false
      t.references :ask, null: false, foreign_key: true

      t.timestamps
    end
  end
end
