FactoryBot.define do
  factory :buyer_form do
    item_id { 1 }
    user_id { 1 }
    post_code { '123-1234' }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    building { Faker::Address.building_number }
    telephone_number { "0" + Faker::Number.between(from: 100000000, to: 9999999999).to_s }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
