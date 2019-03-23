class DropItemTable < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :items, :users
    remove_reference :items, :big_category
    remove_index :items, :big_category_id
    remove_foreign_key :items, :users
    remove_reference :items, :middle_category
    remove_index :items, :middle_category_id
  end
end
