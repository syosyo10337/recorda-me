FactoryBot.define do
  factory :item do
    name { "テスト項目A" }
    association :user
    item_num { nil }
  end
end

