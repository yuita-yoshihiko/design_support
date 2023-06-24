class NotificationRead < ApplicationRecord
  belongs_to :user
  belongs_to :notification

  validates :user_id, uniqueness: { scope: :notification_id }
  validates :user_id, presence: true
  validates :notification_id, presence: true
end
