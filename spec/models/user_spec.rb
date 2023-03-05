require 'rails_helper'

RSpec.describe User, type: :model do
  it "ユーザー名、メールアドレス、パスワードがあれば登録できること" do
    user = User.new(
      name: "first",
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze",
      password_confirmation: "dottle-nouveau-pavilion-tights-furze",
    )
    expect(user).to be_valid
  end

  it "ユーザー名がなければ登録できないこと" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it "メールアドレスがなければ登録できないこと" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it "重複したメールアドレスなら登録できないこと" do
    User.create(
      name: "first",
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze",
      password_confirmation: "dottle-nouveau-pavilion-tights-furze",
    )
    user = User.new(
      name: "first",
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze",
      password_confirmation: "dottle-nouveau-pavilion-tights-furze",
    )
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

  it "パスワードは3文字以上でなければ登録できないこと" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("は3文字以上で入力してください")
  end

  it "パスワードと確認用パスワードが一致しなければ登録できないこと" do
    user = build(:user, password_confirmation: 'bbbbbbbb')
    user.valid?
    expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
  end
end
