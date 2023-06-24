require 'rails_helper'

RSpec.describe Notification, type: :model do
  let(:user) { create(:user, role: 0) }
  let(:admin_user) { create(:user, role: 1) }
  let(:design_tip) { create(:design_tip) }
  let(:notification) { build(:notification, design_tip: design_tip) }

  it "タイトル、url、design_tip_idがあれば登録できること" do
    expect(notification).to be_valid
  end

  it "タイトルがなければ登録できないこと" do
    notification.title = nil
    notification.valid?
    expect(notification.errors[:title]).to include("を入力してください")
  end

  it "タイトルは255文字以内であること" do
    notification.title = 'a' * 256
    notification.valid?
    expect(notification.errors[:title]).to include("は255文字以内で入力してください")
  end

  it "urlがなければ登録できないこと" do
    notification.url = nil
    notification.valid?
    expect(notification.errors[:url]).to include("を入力してください")
  end

  it "design_tip_idがなければ登録できないこと" do
    notification.design_tip_id = nil
    notification.valid?
    expect(notification.errors[:design_tip_id]).to include("を入力してください")
  end

  describe "after createが正常に動作しているかの確認" do
    it "未読の通知が作成されること" do
      expect(notification).to receive(:create_notification_reads)
      notification.save
    end
  end

  describe "管理者ユーザー以外のユーザーに通知が作成されることの確認" do
    before do
      user
      admin_user
      notification.save
    end

    it "管理者ユーザー以外には通知が作成されること" do
      expect(user.notification_reads.find_by(notification: notification)).to be_present
    end
  
    it "管理者ユーザーには通知が作成されないこと" do
      expect(admin_user.notification_reads.find_by(notification: notification)).to be_nil
    end
  end
end
