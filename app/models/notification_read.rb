class NotificationRead < ApplicationRecord
  belongs_to :user
  belongs_to :notification
end
