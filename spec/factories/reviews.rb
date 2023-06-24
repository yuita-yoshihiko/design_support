FactoryBot.define do
  factory :review do
    association :user
    association :design_tip
    score { 1 }
  end
end
