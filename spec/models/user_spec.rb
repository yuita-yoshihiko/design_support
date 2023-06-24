require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it 'ユーザー名、メールアドレス、パスワードがあれば登録できること' do
    expect(user).to be_valid
  end

  it 'ユーザー名がなければ登録できないこと' do
    user.name = nil
    user.valid?
    expect(user.errors[:name]).to include('を入力してください')
  end

  it "ユーザー名は20文字以内であること" do
    user.name = 'a' * 21
    user.valid?
    expect(user.errors[:name]).to include("は20文字以内で入力してください")
  end

  it 'メールアドレスがなければ登録できないこと' do
    user.email = nil
    user.valid?
    expect(user.errors[:email]).to include('を入力してください')
  end

  it '重複したメールアドレスなら登録できないこと' do
    created_user = create(:user)
    user = User.new(
      name: 'first',
      email: created_user.email,
      password: 'dottle-nouveau-pavilion-tights-furze',
      password_confirmation: 'dottle-nouveau-pavilion-tights-furze'
    )
    user.valid?
    expect(user.errors[:email]).to include('はすでに存在します')
  end

  it "パスワードがなければ無効であること" do
    user.password = nil
    user.valid?
    expect(user.errors[:password]).to include("は3文字以上で入力してください")
  end

  it 'パスワードは3文字以上でなければ登録できないこと' do
    user.password = 'a' * 2
    user.valid?
    expect(user.errors[:password]).to include('は3文字以上で入力してください')
  end

  it 'パスワードと確認用パスワードが一致しなければ登録できないこと' do
    user = build(:user, password_confirmation: 'bbbbbbbb')
    user.valid?
    expect(user.errors[:password_confirmation]).to include('とパスワードの入力が一致しません')
  end
end
