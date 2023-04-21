class Review < ApplicationRecord
  belongs_to :user
  belongs_to :design_tip
end
