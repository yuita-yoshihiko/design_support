require 'rails_helper'

RSpec.describe Ask, type: :model do
  let(:ask) { build(:ask) }
  let(:response1) { create(:response) }
  let(:response2) { create(:response) }
  let(:response3) { create(:response) }

  it "質問があれば登録できること" do
    expect(ask).to be_valid
  end

  it "質問がなければ登録できないこと" do
    ask.ask_detail = nil
    ask.valid?
    expect(ask.errors[:ask_detail]).to include("を入力してください")
  end

  it "質問は255文字以内であること" do
    ask.ask_detail = 'a' * 256
    ask.valid?
    expect(ask.errors[:ask_detail]).to include("は255文字以内で入力してください")
  end

  describe "回答コードの配列が返されるかの確認" do
    it "回答コードが配列として返されること" do
      responses = { "0" => response1.id, "1" => response2.id, "2" => response3.id }
      expect(Ask.create_response({ responses: responses })).to eq(response1.is_answer + response2.is_answer + response3.is_answer)
    end
  end
end
