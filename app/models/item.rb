class Item < ApplicationRecord
  belongs_to :user, foreign_key: "seller_id"
  has_many :categories
  has_one :condition
  has_one :shipping_cost
  has_one :shipping_method
  has_one :days_for_shipment
  has_one :status

  with_options presence: true do
    validates :name
    validates :description
  end

end
