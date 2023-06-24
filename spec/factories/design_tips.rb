FactoryBot.define do
  factory :design_tip do
    association :user
    title { 'MyString' }
    guidance { 'MyText' }
    url { 'MyString' }
  end
end
