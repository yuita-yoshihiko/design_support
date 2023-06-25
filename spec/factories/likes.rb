FactoryBot.define do
  factory :like do
    association :user
    association :design_tip
  end
end
