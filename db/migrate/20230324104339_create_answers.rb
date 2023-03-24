class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.string :answer1, null: false
      t.string :answer2, null: false
      t.string :answer3, null: false
      t.string :answer_code, null: false

      t.timestamps
    end
  end
end
