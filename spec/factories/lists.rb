FactoryBot.define do
  factory :list do
    association :user
    name { 'MyString' }
  end
end
