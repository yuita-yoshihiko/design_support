require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:answer) { build(:answer) }

  it "回答コードの配列があれば登録できること" do
    expect(answer).to be_valid
  end

  it "回答コードの配列がなければ登録できないこと" do
    answer.answer_code = nil
    answer.valid?
    expect(answer.errors[:answer_code]).to include("を入力してください")
  end
end
