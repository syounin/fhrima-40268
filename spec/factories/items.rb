FactoryBot.define do
  factory :item do
    item_name                 {Faker::Name.initials(number: 3)}
    item_price                {Faker::Number.between(from: 300, to: 9999999) }
    delivery_cost_id          { 2 }
    item_explanation          {Faker::Lorem.sentence}
    item_condition_id         { 2 }
    prefecture_id             { 2 }
    delivery_day_id           { 2 }
    category_id               { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
