require 'rails_helper'

RSpec.describe Map, type: :model do
  let(:map) { build(:map) }

  it "地域名、緯度、軽度があれば登録できること" do
    expect(map).to be_valid
  end

  it "地域名がなければ登録できないこと" do
    map.name = nil
    map.valid?
    expect(map.errors[:name]).to include("を入力してください")
  end

  it "緯度がなければ登録できないこと" do
    map.latitude = nil
    map.valid?
    expect(map.errors[:latitude]).to include("を入力してください")
  end

  it "軽度がなければ登録できないこと" do
    map.longitude = nil
    map.valid?
    expect(map.errors[:longitude]).to include("を入力してください")
  end
end
