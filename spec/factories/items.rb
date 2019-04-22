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
    brand_id              { Brand.all.sample.id }
    size_id               { Size.all.sample.id }
    condition_id          { Condition.all.sample.id }
    shipping_cost_id      { ShippingCost.all.sample.id }
    shipping_method_id    { ShippingMethod.all.sample.id }
    sender_prefecture     { Prefecture.all.sample.id }
    days_for_shipment_id  { DaysForShipment.all.sample.id }
    status_id             { Statuse.all.sample.id }
    price                 { Random.rand(300..9999999) }
    created_at            { Faker::Time.between(2.days.ago, Time.now, :all) }
  end
end
