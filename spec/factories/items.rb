Faker::Config.locale = :ja

FactoryBot.define do

  factory :item do
    association :seller_id, factory: :user
    association :buyer_id, factory: :user
    name                  { Faker::App.name }
    description     { Faker::Lorem.sentences(1) }
    big_category_id                  { 1 }
    middle_category_id               { 14 }
    small_category_id                { 47 }
    brand_id          { 1 }
    size_id           { 1 }
    condition_id                  { 1 }
    shipping_cost_id               { 1 }
    shipping_method_id               { 1 }
    sender_prefecture                      { "東京都" }
    days_for_shipment_id            { 1 }
    status_id                  { 1 }
    price              { Faker::Number.number(4) }
  end
end
