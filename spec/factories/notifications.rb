FactoryBot.define do
  factory :notification do
    association :design_tip
    title { design_tip.title }
    url { design_tip.url }
  end
end
