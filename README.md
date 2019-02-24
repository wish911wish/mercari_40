# DB設計

## users table

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|family_name_kanji|string|null: false|
|first_name_kanji|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|
|postal_code|string||
|prefectures|string||
|city|string||
|street_address|string||
|building|string||
|phone_number|string|null: false|
|introduction|text||
|image|string||
|email|string|null: false, unique: true|


### Association
- has_one :address
- has_many :evaluations
- has_many :transactions
- has_many :items



## addresses table

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|family_name_kanji|string|null: false|
|first_name_kanji|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|street_address|string|null: false|
|building|string||
|phone_number|string||

### Association
- belongs_to :user



## user_evaluations table

|Column|Type|Options|
|------|----|-------|
|evaluator|references|foreign_key: { to_table: :users }|
|evaluatee|references|foreign_key: { to_table: :users }|
|evaluation|integer||

### Association
- belongs_to :user



## items table

|Column|Type|Options|
|------|----|-------|
|seller|references|foreign_key: { to_table: :users }|
|buyer|references|foreign_key: { to_table: :users }|
|name|string|index: true, null: false|
|description|text|null: false|
|big_category_id|references|foreign_key: { to_table: :users }|
|middle_category_id|references|foreign_key: { to_table: :users }|
|middle_category_id|references|foreign_key: { to_table: :users }|
|brand_id|references|foreign_key: { to_table: :users }|
|size_id|references|foreign_key: true|
|item_status|integer|null: false|
|delivery_fee|integer|null: false|
|delivery_method|integer|null: false|
|delivery_date|integer|null: false|
|price|integer||
|transaction_status|string||

### Association
- belongs_to :user
- belongs_to :transaction
- has_many :categories
- has_many :item_images



## categories table

|Column|Type|Options|
|------|----|-------|
|name|string|index: true|
|parent|integer||

### Association
- has_many :items
- has_many :sizes



## sizes table

|Column|Type|Options|
|------|----|-------|
|category_id|string||
|size|string||

### Association
- belongs_to :category
- has_many :items



## item_images table

|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
|image|string||

### Association
- belongs_to :item



## brands table

|Column|Type|Options|
|------|----|-------|
|name|string||

### Association
- has_many :items
