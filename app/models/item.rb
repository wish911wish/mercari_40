class Item < ApplicationRecord
  belongs_to :user, foreign_key: "seller_id"
  has_many :categories
  has_one :condition
  has_one :shipping_cost
  has_one :shipping_method
  has_one :days_for_shipment
  has_one :status
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images

  with_options presence: true do
    validates :name
    validates :description
    validates :big_category_id
    validates :middle_category_id
    validates :small_category_id
    validates :condition_id
    validates :shipping_cost_id
    validates :shipping_method_id
    validates :sender_prefecture
    validates :days_for_shipment_id
    validates :status_id
    validates :price
  end

  validates :description, length: { maximum: 40 }
  validates :price ,numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :item_images, length: { minimum: 1, maximum: 40 }
end
