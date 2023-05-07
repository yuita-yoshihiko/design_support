class RemoveDetailsFromAnswers < ActiveRecord::Migration[7.0]
  def change
    remove_column :answers, :answer1, :string
    remove_column :answers, :answer2, :string
    remove_column :answers, :answer3, :string
  end
end
