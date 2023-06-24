require 'rails_helper'

RSpec.describe MapDetail, type: :model do
  let(:map_detail) { create(:map_detail) }

  it "サイト名、url、map_idがあれば登録できること" do
    expect(map_detail).to be_valid
  end

  it "サイト名がなければ登録できないこと" do
    map_detail.name = nil
    map_detail.valid?
    expect(map_detail.errors[:name]).to include("を入力してください")
  end

  it "サイト名は255文字以内であること" do
    map_detail.name = 'a' * 256
    map_detail.valid?
    expect(map_detail.errors[:name]).to include("は255文字以内で入力してください")
  end

  it "urlがなければ登録できないこと" do
    map_detail.url = nil
    map_detail.valid?
    expect(map_detail.errors[:url]).to include("を入力してください")
  end

  it "map_idがなければ登録できないこと" do
    map_detail.map_id = nil
    map_detail.valid?
    expect(map_detail.errors[:map_id]).to include("を入力してください")
  end
end
