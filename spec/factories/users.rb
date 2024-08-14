FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3) }
    password_confirmation { password }
    last_name { Faker::Japanese::Name.last_name }
    first_name { Faker::Japanese::Name.first_name }
    last_name_kana { Faker::Japanese::Name.last_name.yomi }
    first_name_kana { Faker::Japanese::Name.first_name.yomi }
    birth_date { Faker::Date.between(from: '1930-01-01', to: Date.today - 18.years) }
  end
end
