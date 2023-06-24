require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:like) { create(:like) }

  it 'user_id、design_tip_idがあれば登録できること' do
    expect(like).to be_valid
  end

  it 'user_idがあれば登録できること' do
    like.user = nil
    like.valid?
    expect(like.errors[:user]).to include('を入力してください')
  end

  it 'design_tip_idがあれば登録できること' do
    like.design_tip = nil
    like.valid?
    expect(like.errors[:design_tip]).to include('を入力してください')
  end

  it '既にお気に入りしている情報はお気に入りできないこと' do
    duplicate_like = like.dup
    duplicate_like.valid?
    expect(duplicate_like.errors[:user_id]).to include('はすでに存在します')
  end
end