FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "テスト項目#{n}" }
    association :user
    item_num { nil }
  end
end

