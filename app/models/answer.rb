class Answer < ApplicationRecord
  has_many :design_tips, through: :answer_design_tips

  validates :answer_code, presence: true
end
