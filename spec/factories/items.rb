FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "テスト項目#{n}" }
    association :user

    factory :named_item do
      name { 'テスト用の項目' }
    end

    factory :item_with_logs do
      after(:create) { |item| create_list(:log, 10, item: item) }
    end
  end
end
