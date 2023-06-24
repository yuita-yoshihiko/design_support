require 'rails_helper'

RSpec.describe List, type: :model do
  let(:list) { build(:list) }

  it 'リスト名があれば登録できること' do
    expect(list).to be_valid
  end

  it "リスト名は255文字以内であること" do
    list.name = 'a' * 256
    list.valid?
    expect(list.errors[:name]).to include("は255文字以内で入力してください")
  end

  it 'リスト名がなければ登録できないこと' do
    list.name= nil
    list.valid?
    expect(list.errors[:name]).to include('を入力してください')
  end
end
