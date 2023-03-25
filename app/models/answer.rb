class Answer < ApplicationRecord
  has_many :design_tips, through: :answer_design_tips

  def self.get_answer(answer1, answer2, answer3)
    answer_code = "#{answer1}#{answer2}#{answer3}"
  end
end
