class RemoveReferenceFromItem < ActiveRecord::Migration[5.0]
  def change
    remove_index :items, :seller_id
    remove_reference :items, :seller
  end
end
