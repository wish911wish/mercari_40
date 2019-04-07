class Category < ApplicationRecord
  has_many :items
  has_one :category_size
end
