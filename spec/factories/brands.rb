FactoryBot.define do
  factory :brand do
    name  { Faker::Artist.name }
    category_id  { 1 }
  end
end
