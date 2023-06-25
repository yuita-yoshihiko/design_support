FactoryBot.define do
  factory :response do
    association :ask
    content { 'test' }
    is_answer { 'A' }
  end
end
