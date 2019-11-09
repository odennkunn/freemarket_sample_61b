FactoryBot.define do
  
  factory :image do
    id {"2"}
    image {Faker::Lorem.word}
    item_id {"2"}
  end
end

