FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3) }
    password_confirmation { password }

    birth_date { Faker::Date.between(from: '1930-01-01', to: Date.today - 18.years) }
  end
end
