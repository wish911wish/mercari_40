class Item < ApplicationRecord
  belongs_to :user
  has_many :categories
  has_many :item_images
  has_one :condition
  has_one :shipping_cost
  has_one :shipping_method
  has_one :days_for_shipment
  has_one :status
end
