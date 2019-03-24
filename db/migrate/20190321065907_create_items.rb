class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.references :seller, null: false, foreign_key: { to_table: :users }
      t.references :buyer, foreign_key: { to_table: :users }
      t.string :name, index: true, null: false
      t.text :description
      t.references :big_category, foreign_key: { to_table: :categories }
      t.references :middle_category, foreign_key: { to_table: :categories }
      t.references :small_category, foreign_key: { to_table: :categories }
      t.references :brand, foreign_key: true
      t.references :size, foreign_key: true
      t.references :condition, null: false, foreign_key: true
      t.references :shipping_cost, null: false, foreign_key: true
      t.references :shipping_method, null: false, foreign_key: true
      t.string :sender_prefecture, null: false
      t.references :days_for_shipment, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: true
      t.integer :price, null: false
      t.timestamps
    end
  end
end
