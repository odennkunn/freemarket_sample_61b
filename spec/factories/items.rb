FactoryBot.define do

  factory :item do
    name         {Faker::Name.name}
    explanation  {Faker::Lorem.word}
    price        {Faker::Number.number(5)}
    size         {Faker::Number.number(2)}
    status       {Faker::Lorem.word}
    delivery_fee {Faker::Lorem.word}
    user_id      {"2"}
    category_id  {"2"}
    bland_id     {"2"}
    delivery_way {Faker::Lorem.word}
    delivery_day {Faker::Lorem.word}
  end
end