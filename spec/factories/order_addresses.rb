FactoryBot.define do
  factory :order_address do
    post_code {"123-4567"}
    prefecture_id {'14'}
    city {"東京"}
    phone_number {"08077773344"}
    address {"青山1-1-1"}
    building {"光寫眞館"}
    token {"tok_abcdefghijk00000000000000000"}
    association :user, :item
  end
end
