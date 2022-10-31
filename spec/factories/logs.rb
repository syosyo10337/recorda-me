FactoryBot.define do
  factory :log do
    amount { 30 }
    association :item

    trait :created_yesterday do
      created_at { Time.zone.yesterday }
    end

    trait :created_two_days_ago do
      created_at { 2.days.ago }
    end
  end
end
