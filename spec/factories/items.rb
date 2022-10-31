FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "テスト項目#{n}" }
    association :user
    item_num { nil }

    factory :named_item do
      name { 'テスト用の項目' }
    end
  end
end