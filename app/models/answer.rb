class Answer < ApplicationRecord
  has_many :design_tips, through: :answer_design_tips

  validates :answer1, presence: true
  validates :answer2, presence: true
  validates :answer3, presence: true
  validates :answer_code, presence: true

  def self.get_answer(answer1, answer2, answer3)
    answer_code = "#{answer1}#{answer2}#{answer3}"
  end
end
