FactoryBot.define do
  factory :user do
    name { "Masanao Takahashi"}
    sequence(:email) { |n| "test#{n}@examle.com" }
    password { "dottle-nouveau-pavilion-tights-furze" }
  end

  
end
