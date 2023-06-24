FactoryBot.define do
  factory :choice do
    association :quiz
    content { 'test' }
    correct { true }
  end
end
