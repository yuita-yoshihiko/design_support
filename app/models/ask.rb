class Ask < ApplicationRecord
  has_many :responses, dependent: :destroy

  validates :ask_detail, presence: true
end
