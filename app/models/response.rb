class Response < ApplicationRecord
  belongs_to :ask

  validates :content, presence: true, length: { maximum: 65_535 }
  validates :is_answer, presence: true
  validates :ask_id, presence: true
end
