class AddColumnSizes < ActiveRecord::Migration[5.0]
  def change
    add_column :sizes, :size_group, :integer
  end
end
