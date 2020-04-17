FactoryBot.define do
  factory :post do
    place_name { Faker::Lorem.characters(number:10) }
    title { Faker::Lorem.characters(number:15) }
    content { Faker::Lorem.characters(number:200) }
  end
end