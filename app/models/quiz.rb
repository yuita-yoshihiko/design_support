class Quiz < ApplicationRecord
  has_many :choices, dependent: :destroy

  validates :question, presence: true
  validates :commentary, presence: true

  def self.check_answer(params)
    correct = params[:correct]
    if correct == "true"
      "正解です！"
    elsif correct == "false"
      "残念、不正解です..."
    end
  end
end
