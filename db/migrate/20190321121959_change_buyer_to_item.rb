class ChangeBuyerToItem < ActiveRecord::Migration[5.0]
  def change
    change_column_null :items, :buyer_id, true
  end
end
