# メルカリ コピーサイト

## 製作
65期チームB

# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|family_name|string|null: false|
|first_name|stirng|null: false|
|family_name_kana|string|null:false|
|first_name_kana|string|null:false|
|birth_day|date|null:false|
|password|string|null: false|
|email|string|null: false, unique: true|
|destination_family_name|string|null:false|
|destination_first_name|string|null:false|
|destination_family_name_kana|string|null:false|
|destination_first_name_kana|string|null:false|
|postcode|integer|null:false|
|prefecture|string|null:false|
|address_city|string|null:false|
|address_block|integer|null:false|
|address_building|string||
|phone_number integer||
### Association
- has_many :items
- has_many :comments
- has_many :buy_items

## itemsテーブル(商品出品テーブル)
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|image|string|null: false|
|description|text|null: false|
|state|string|null: false|
|postage|string|null: false|
|prefecture|string|null: false|
|shipping_date|string|null: false|
|price|string|null: false|
|category_id|string|foreign_key: true|
|saler_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
### Association
- has_many :comments
- belongs_to :user
- belongs_to :category

## buy_itemsテーブル(商品購入テーブル)
|Column|Type|Options|
|------|----|-------|
|card_num|string||
|month|string||
|year|string||
|code|string||
### Association
- belongs_to :user

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null: false|
|ancestry|stringindex|
### Association
- has_many :items

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :items