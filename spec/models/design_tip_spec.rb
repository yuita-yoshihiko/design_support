require 'rails_helper'

RSpec.describe DesignTip, type: :model do
  let(:design_tip) { build(:design_tip) }

  it 'タイトル、説明文、urlがあれば登録できること' do
    expect(design_tip).to be_valid
  end

  it 'タイトルがなければ登録できないこと' do
    design_tip.title = nil
    design_tip.valid?
    expect(design_tip.errors[:title]).to include('を入力してください')
  end

  it "タイトルは255文字以内であること" do
    design_tip.title = 'a' * 256
    design_tip.valid?
    expect(design_tip.errors[:title]).to include("は255文字以内で入力してください")
  end

  it '説明文がなければ登録できないこと' do
    design_tip.guidance = nil
    design_tip.valid?
    expect(design_tip.errors[:guidance]).to include('を入力してください')
  end

  it "説明文は65535文字以内であること" do
    design_tip.guidance = 'a' * 65536
    design_tip.valid?
    expect(design_tip.errors[:guidance]).to include("は65535文字以内で入力してください")
  end

  it 'urlがなければ登録できないこと' do
    design_tip.url = nil
    design_tip.valid?
    expect(design_tip.errors[:url]).to include('を入力してください')
  end
end
