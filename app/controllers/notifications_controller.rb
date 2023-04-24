class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications
    @notifications.each do |notification|
      notification_read = current_user.notification_reads.find_by(notification_id: notification.id)
      notification_read.update(checked: true) if notification_read.present?
    end
  end
end
