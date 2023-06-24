require 'rails_helper'

RSpec.describe Response, type: :model do
  let(:response) { create(:response) }

  it "選択肢、回答コード、ask_idがあれば登録できること" do
    expect(response).to be_valid
  end

  it "選択肢がなければ登録できないこと" do
    response.content = nil
    response.valid?
    expect(response.errors[:content]).to include("を入力してください")
  end

  it "回答コードがなければ登録できないこと" do
    response.is_answer = nil
    response.valid?
    expect(response.errors[:is_answer]).to include("を入力してください")
  end

  it "ask_idがなければ登録できないこと" do
    response.ask_id = nil
    response.valid?
    expect(response.errors[:ask_id]).to include("を入力してください")
  end
end
