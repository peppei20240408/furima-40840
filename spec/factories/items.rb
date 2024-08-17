FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    category_id { Category.pluck(:id).drop(1).sample }
    condition_id { Condition.pluck(:id).drop(1).sample }
    delivery_charge_id { DeliveryCharge.pluck(:id).drop(1).sample }
    shipping_area_id { ShippingArea.pluck(:id).drop(1).sample }
    shipping_day_id { ShippingDay.pluck(:id).drop(1).sample }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
