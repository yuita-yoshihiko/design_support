class Quiz < ApplicationRecord
  has_many :choices, dependent: :destroy

  validates :question, presence: true
  validates :commentary, presence: true
end
