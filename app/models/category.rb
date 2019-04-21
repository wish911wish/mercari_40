class Category < ApplicationRecord
  has_many :items
  has_one :category_size
  has_one :size, through: :category_size
end
