class DropSmallCategoryFromItem < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :items, :users
    remove_index :items, :small_category_id
    remove_reference :items, :small_category
  end
end
