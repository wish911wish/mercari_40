class DropSmallCategoryFromItem < ActiveRecord::Migration[5.0]
  def change
    remove_reference :items, :small_category
  end
end
