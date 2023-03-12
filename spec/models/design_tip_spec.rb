require 'rails_helper'

RSpec.describe DesignTip, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it 'タイトル、説明文、urlがあれば登録できること' do
    design_tip = DesignTip.new(
      title: 'first',
      guidance: 'text',
      url: 'url',
      user: @user
    )
    expect(design_tip).to be_valid
  end

  it 'タイトルがなければ登録できないこと' do
    design_tip = DesignTip.new(title: nil)
    design_tip.valid?
    expect(design_tip.errors[:title]).to include('を入力してください')
  end

  it '説明文がなければ登録できないこと' do
    design_tip = DesignTip.new(guidance: nil)
    design_tip.valid?
    expect(design_tip.errors[:guidance]).to include('を入力してください')
  end

  it 'urlがなければ登録できないこと' do
    design_tip = DesignTip.new(url: nil)
    design_tip.valid?
    expect(design_tip.errors[:url]).to include('を入力してください')
  end
end
