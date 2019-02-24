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
- has_many :user_evaluations
- has_many :item_evaluations
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
|evaluator_id|references|foreign_key: { to_table: :users }|
|evaluatee_id|references|foreign_key: { to_table: :users }|
|evaluation|integer||

### Association
- belongs_to :user



## items table

|Column|Type|Options|
|------|----|-------|
|seller_id|references|foreign_key: { to_table: :users }|
|buyer_id|references|foreign_key: { to_table: :users }|
|name|string|index: true, null: false|
|description|text||
|big_category_id|references|foreign_key: { to_table: :users }|
|middle_category_id|references|foreign_key: { to_table: :users }|
|small_category_id|references|foreign_key: { to_table: :users }|
|brand_id|references|foreign_key: { to_table: :users }|
|size_id|references|foreign_key: true|
|condition_id|integer|null: false|
|shipping_cost_id|integer|null: false|
|shipping_method_id|integer|null: false|
|sender_prefecture|string|null: false|
|days_for_shipment_id|references|foreign_key: true|
|status_id|references|foreign_key: true|
|price|integer|null: false|

### Association
- belongs_to :user
- has_many :categories
- has_many :item_images
- has_many :item_evaluations
- has_one :condition
- has_one :shipping_cost
- has_one :days_for_shipment
- has_one :status


## categories table

|Column|Type|Options|
|------|----|-------|
|name|string|index: true|
|parent_category|integer||

### Association
- has_many :items
- has_many :sizes


## brands table

|Column|Type|Options|
|------|----|-------|
|name|string|index: true|
|category_id|references|foreign_key: true|

### Association
- has_many :items



## item_evaluations table

|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
|user_id|references|foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user



## item_images table

|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
|image|string||

### Association
- belongs_to :item



## sizes table

|Column|Type|Options|
|------|----|-------|
|category_id|references|foreign_key: true|
|name|string||

### Association
- belongs_to :category
- has_many :items


## conditions table

|Column|Type|Options|
|------|----|-------|
|name|string||

### Association
- belongs_to :item


## shipping_costs table

|Column|Type|Options|
|------|----|-------|
|name|string||

### Association
- belongs_to :item



## shipping_methods table

|Column|Type|Options|
|------|----|-------|
|name|string||

### Association
- belongs_to :item


## days_for_shipments table

|Column|Type|Options|
|------|----|-------|
|name|string||

### Association
- belongs_to :item



## statuses table

|Column|Type|Options|
|------|----|-------|
|name|string||

### Association
- belongs_to :item
