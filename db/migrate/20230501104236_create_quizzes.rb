class CreateQuizzes < ActiveRecord::Migration[7.0]
  def change
    create_table :quizzes do |t|
      t.string :question, null: false
      t.text :commentary, null: false

      t.timestamps
    end
  end
end
