FactoryBot.define do
  factory :log do
    amount { 30 },
    association :item 
    
  end
end
