class ItemImage < ApplicationRecord
  mount_uploader :image, ImageUploader
end
