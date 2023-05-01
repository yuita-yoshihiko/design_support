class CreateChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :choices do |t|
      t.string :content, null: false
      t.boolean :correct, null: false, default: false
      t.references :quiz, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
