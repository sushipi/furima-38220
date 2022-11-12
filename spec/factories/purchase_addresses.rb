FactoryBot.define do
  factory :purchase_address do
    post_code { '123-4567' }
    prefecture_id { 0 }
    city { '東京都' }
    address { '千代田1-1' }
    building_name { '東京ハイツ' }
    phone_number { '00011112222' }  
  end
end
