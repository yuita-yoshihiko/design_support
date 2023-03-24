class Answer < ApplicationRecord
  has_many :design_tips, through: :answer_design_tips

  ANSWER_MAPPING = {
    "AAA" => :answer_1,
    "AAB" => :answer_2,
    "ABA" => :answer_3,
    "ABB" => :answer_4,
    "BAA" => :answer_5,
    "BAB" => :answer_6,
    "BBA" => :answer_7,
    "BBB" => :answer_8,
  }.freeze

  def self.get_answer(answer1, answer2, answer3)
    answer_code = "#{answer1}#{answer2}#{answer3}"
    ANSWER_MAPPING[answer_code] || :not_found
  end
end
