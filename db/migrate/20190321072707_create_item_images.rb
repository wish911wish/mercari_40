class CreateItemImages < ActiveRecord::Migration[5.0]
  def change
    create_table :item_images do |t|
      t.json :image
      # t.references  :item, foreign_key: true
      # t.timestamps
    end
  end
end
