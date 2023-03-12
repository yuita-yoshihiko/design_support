require 'rails_helper'

RSpec.describe List, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  it 'リスト名があれば登録できること' do
    list = List.new(
      name: 'first',
      user: @user
    )
    expect(list).to be_valid
  end

  it 'リスト名がなければ登録できないこと' do
    list = List.new(name: nil)
    list.valid?
    expect(list.errors[:name]).to include('を入力してください')
  end
end
