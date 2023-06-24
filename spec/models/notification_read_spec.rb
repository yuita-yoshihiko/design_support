require 'rails_helper'

RSpec.describe NotificationRead, type: :model do
  let(:notification_read) { build(:notification_read) }

  it 'user_idがなければ登録できないこと' do
    notification_read.user_id= nil
    notification_read.valid?
    expect(notification_read.errors[:user_id]).to include('を入力してください')
  end

  it 'notification_idがなければ登録できないこと' do
    notification_read.notification_id= nil
    notification_read.valid?
    expect(notification_read.errors[:notification_id]).to include('を入力してください')
  end
end
