FactoryBot.define do
  factory :item do

    item_name {Faker::Name.initials}
    item_info {Faker::Lorem.sentence}
    item_category_id { '2' }
    item_sales_status_id { '3'}
    item_shipping_fee_status_id { '2' }
    item_prefecture_id { '3'}
    item_scheduled_delivery_id { '2' }
    item_price {'1000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end