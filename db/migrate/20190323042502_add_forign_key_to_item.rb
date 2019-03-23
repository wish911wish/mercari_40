class AddForignKeyToItem < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :big_category, foreign_key: { to_table: :categories }
    add_reference :items, :middle_category, foreign_key: { to_table: :categories }
    add_reference :items, :small_category, foreign_key: { to_table: :categories }
  end
end
