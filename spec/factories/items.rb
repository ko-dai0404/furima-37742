FactoryBot.define do
  factory :item do
    product        { '商品名です！' }
    description    { '商品の説明をします！' }
    category_id    { '2' }
    status_id      { '2' }
    burden_id      { '2' }
    prefectures_id { '2' }
    shipping_id    { '2' }
    price          { '10000' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
