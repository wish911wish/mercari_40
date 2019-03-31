class CreateDaysForShipments < ActiveRecord::Migration[5.0]
  def change
    create_table :days_for_shipments do |t|
      t.string    :name, null: false
      t.timestamps
    end
  end
end
