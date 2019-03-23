class DropSmallCategoryFromItem < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :items, :users
    remove_reference :items, :small_category
    remove_index :items, :small_category_id
  end
end
