require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'reset_password_email' do
    let(:user) { create(:user, reset_password_token: 'test_token') }
    let(:mail) { UserMailer.reset_password_email(user) }

    it 'renders the headers' do
      expect(mail.subject).to eq('パスワードリセット')
      expect(mail.to).to eq(['user_1@example.com'])
      expect(mail.from).to eq(['noreply@anyonedesign.com'])
    end

  end
end
