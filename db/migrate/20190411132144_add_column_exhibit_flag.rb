class AddColumnExhibitFlag < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :exhibit_flag, :boolean, default: true
  end
end
