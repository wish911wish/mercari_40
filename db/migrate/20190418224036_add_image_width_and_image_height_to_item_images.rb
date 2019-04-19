class AddImageWidthAndImageHeightToItemImages < ActiveRecord::Migration[5.0]
  def change
    add_column :item_images, :image_width, :integer
    add_column :item_images, :image_height, :integer
  end
end
