FactoryBot.define do
  factory :map_detail do
    association :map
    name { 'content' }
    url { 'url' }
  end
end
