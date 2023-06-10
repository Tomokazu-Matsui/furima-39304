FactoryBot.define do
  factory :order_form do
    
    postal_code { '590-0000' }
    item_prefecture_id { 5 }
    city { '千早青坂村' }
    addresses { '1-0-1' }
    building { 'クラブハウス101' }
    phone_number { '07077777777' }
  end
end