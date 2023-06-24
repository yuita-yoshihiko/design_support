require 'rails_helper'

RSpec.describe Choice, type: :model do
  let(:choice) { build(:choice) }

  it "回答文、正誤があれば登録できること" do
    expect(choice).to be_valid
  end

  it "回答文がなければ登録できないこと" do
    choice.content = nil
    choice.valid?
    expect(choice.errors[:content]).to include("を入力してください")
  end

  it "説明文は500文字以内であること" do
    choice.content = 'a' * 501
    choice.valid?
    expect(choice.errors[:content]).to include("は500文字以内で入力してください")
  end

  it "正誤がなければ登録できないこと" do
    choice.correct = nil
    choice.valid?
    expect(choice.errors[:correct]).to include("を入力してください")
  end
end
