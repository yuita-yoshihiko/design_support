class AnswerDesignTip < ApplicationRecord
  belongs_to :answer
  belongs_to :design_tip

  validates :design_tip_id, uniqueness: { scope: :answer_id }
end
