class Choice < ApplicationRecord
  belongs_to :quiz

  validates :content, presence: true, length: { maximum: 500 }
  validates :correct, presence: true
end
