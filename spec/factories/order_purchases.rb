FactoryBot.define do
  factory :order_purchase do
    postal         { '123-1234' }
    prefectures_id { '2' }
    city           { 'X市' }
    address        { 'X番' }
    building       { 'Xマンション' }
    telephone      { '09012345678' }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
