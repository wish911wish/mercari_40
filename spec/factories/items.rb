require 'pry'
Faker::Config.locale = :ja

FactoryBot.define do

  factory :item do
    association :seller_id, factory: :user
    association :buyer_id, factory: :user
    name                  { Faker::App.name }
    description     { Faker::Lorem.sentences(1) }
    association :big_category_id, factory: :big_category
    association :middle_category_id, factory: :middle_category
    association :small_category_id, factory: :small_category
    association :brand_id, factory: :brand
    association :size_id, factory: :size
    association :condition_id, factory: :condition
    association :shipping_cost_id, factory: :shipping_cost
    association :shipping_method_id, factory: :shipping_method
    sender_prefecture                      { "東京都" }
    association :days_for_shipment_id, factory: :days_for_shipment
    association :status_id, factory: :status
    price              { Faker::Number.number(4) }
  end
end
