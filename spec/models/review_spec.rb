require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:review) { create(:review) }

  it "user_id、design_tip_id、評価があれば登録できること" do
    expect(review).to be_valid
  end

  it "user_idがなければ登録できないこと" do
    review.user_id = nil
    review.valid?
    expect(review.errors[:user_id]).to include("を入力してください")
  end

  it "design_tip_idがなければ登録できないこと" do
    review.design_tip_id = nil
    review.valid?
    expect(review.errors[:design_tip_id]).to include("を入力してください")
  end

  it "評価がなければ登録できないこと" do
    review.score = nil
    review.valid?
    expect(review.errors[:score]).to include("を入力してください")
  end
end
