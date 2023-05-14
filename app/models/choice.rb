class Choice < ApplicationRecord
  belongs_to :quiz

  validates :content, presence: true, length: { maximum: 65_535 }
  validates :correct, presence: true
end
