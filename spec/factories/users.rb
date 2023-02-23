FactoryBot.define do
  factory :user do
    name { 'Masanao Takahashi' }
    sequence(:email) { |n| "test#{n}@examle.com" }
    password { 'dottle-nouveau-pavilion-tights-furze' }

    trait :with_items do
      after(:create) { |user| create_list(:item, 12, user: user) }
    end
  end
end