class DropItemTable < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :items, :users
    remove_reference :items, :big_category
    remove_reference :items, :middle_category
  end
end
