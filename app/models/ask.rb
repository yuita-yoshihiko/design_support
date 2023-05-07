class Ask < ApplicationRecord
  has_many :responses, dependent: :destroy
end
