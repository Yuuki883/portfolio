FactoryBot.define do
  factory :topic do
    title { Faker::Lorem.characters(number:50) }
  end
end