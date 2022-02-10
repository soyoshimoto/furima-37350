FactoryBot.define do
  factory :item do
    items_name              {'マウンテンパーカー'}
    explanation      {'とても良いです。'}
    category_id     {'2'}
    condition_id {'2'}
    shipping_charges_burden_id {'2'}
    prefecture_id {'2'}
    shipping_day_id {'2'}
    price {'6000'}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
