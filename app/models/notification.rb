class Notification < ApplicationRecord
  after_create :create_notification_reads
  default_scope -> { order(created_at: :desc) }
  belongs_to :design_tip
  has_many :notification_reads, dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
  validates :url, presence: true
  validates :design_tip_id, presence: true

  def create_notification_reads
    User.where(role: 0).find_each do |user|
      notification_read = user.notification_reads.build(notification: self, checked: false)
      notification_read.save
    end
  end
end
