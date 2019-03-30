class ItemImage < ApplicationRecord
  mount_uploaders :image, ImageUploader
  serialize :post_image, JSON
  # belongs_to :item
end
