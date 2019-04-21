require 'pry'
Faker::Config.locale = :ja

FactoryBot.define do
  factory :item do
    small_category = Category.find(Random.rand(159..952))
    middle_category = Category.find(small_category.parent)
    big_category = Category.find(middle_category.parent)
    seller_id             { }
    buyer_id              { }
    name                  { Faker::App.name }
    description           { Faker::Lorem.sentences(1) }
    big_category_id       { big_category.id }
    middle_category_id    { middle_category.id }
    small_category_id     { small_category.id }
    brand_id              { Random.rand(1..42) }
    size_id               { Random.rand(1..42) }
    condition_id          { Random.rand(1..6) }
    shipping_cost_id      { Random.rand(1..2) }
    shipping_method_id    { Random.rand(1..9) }
    sender_prefecture     { Prefecture.find(Random.rand(1..47)).name }
    days_for_shipment_id  { Random.rand(1..3) }
    status_id             { Random.rand(1..4) }
    price                 { Random.rand(300..9999999) }
    created_at            { Faker::Time.between(2.days.ago, Time.now, :all) }
  end
end
