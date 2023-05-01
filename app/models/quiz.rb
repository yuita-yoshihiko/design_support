class Quiz < ApplicationRecord
  has_many :choices, dependent: :destroy
end
