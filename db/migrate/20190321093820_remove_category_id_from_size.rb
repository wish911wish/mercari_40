class RemoveCategoryIdFromSize < ActiveRecord::Migration[5.0]
  def change
    remove_reference :sizes, :category, index: true
  end
end
