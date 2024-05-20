FactoryBot.define do
  factory :item do
    item_price                {Faker::Number.between(from: 300, to: 9999999) }
    delivery_cost_id         { DeliveryCostGenre.all.sample }
    item_explanation            {Faker::Lorem.sentence}
    item_condition_id          {ItemConditionGenre.all.sample}
    prefecture_id             {PrefectureGenre.all.sample}
    delivery_day_id           {DeliveryDayGenre.all.sample}
    category_id             { CategoryGenre.all.sample }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
