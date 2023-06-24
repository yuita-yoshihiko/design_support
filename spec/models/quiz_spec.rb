require 'rails_helper'

RSpec.describe Quiz, type: :model do
  let(:quiz) { build(:quiz) }

  it "問題、解説があれば登録できること" do
    expect(quiz).to be_valid
  end

  it "問題がなければ登録できないこと" do
    quiz.question = nil
    quiz.valid?
    expect(quiz.errors[:question]).to include("を入力してください")
  end

  it "解説がなければ登録できないこと" do
    quiz.commentary = nil
    quiz.valid?
    expect(quiz.errors[:commentary]).to include("を入力してください")
  end

  describe "解答の正解、不正解の確認" do
    context "正解の場合" do
      it "'正解です！'と表示されること" do
        expect(Quiz.check_answer({ correct: 'true' })).to eq '正解です！'
      end
    end

    context "不正解の場合" do
      it "'残念、不正解です...'と表示されること" do
        expect(Quiz.check_answer({ correct: 'false' })).to eq '残念、不正解です...'
      end
    end
  end
end
