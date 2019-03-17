class AddColumnUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nickname, :string, null: false, index: true
    add_column :users, :family_name, :string, null: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :family_name_kana, :string, null: false
    add_column :users, :first_name_kana, :string, null: false
    add_column :users, :birthday, :date, null: false
    add_column :users, :postal_code, :string
    add_column :users, :prefectures, :string
    add_column :users, :city, :string
    add_column :users, :street_address, :string
    add_column :users, :building, :string
    add_column :users, :phone_number, :string
    add_column :users, :introduction, :string
    add_column :users, :image, :string
  end
  change_table :users, bulk: true
end
