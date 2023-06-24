FactoryBot.define do
  factory :notification_read do
    association :user
    association :notification
    checked { false }
  end
end
