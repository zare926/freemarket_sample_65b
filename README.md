# メルカリ コピーサイト

## 製作
65期チームB

# DB設計

## ER図
[ER図](https://gyazo.com/eeb977c4e264ef5e7fc327e2766553b3)

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_day|date|null: false|
|password|string|null: false|
|email|string|null:false, unique :true|
|destination_family_name|string|null: false|
|destination_first_name|string|null: false|
|destination_family_name_kana|string|null: false|
|destination_first_name_kana|string|null: false|
|postcode|integer|null: false|
|prefecture|string|null: false|
|address_city|string|null: false|
|address_block|string|null: false|
|address_building|string||
|phone_number|integer|null: false|
### Association
- has_many :item
- has_many :comments
- has_many :buy_item
- has_many :image
- has_many :credit_card

## itemsテーブル(商品出品テーブル)
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index :true|
|status|integer|default: 0|
|description|text|null: false|
|brand|string||
|state|integer|null: false|
|postage|integer|null: false|
|prefecture|string|null: false|
|shipping_date|integer|null: false|
|price|integer|null: false|
|user_id|references|null: false,foreign_key: true|
|category_id|references|foreign_key: true|
### Association
- has_many :comments
- has_many :images
- belongs_to :user
- belongs_to :category

## buy_itemsテーブル(商品購入テーブル)
|Column|Type|Options|
|------|----|-------|
|buy_date|date|null: false|
|user_id|references|null: false,foreign_key: true|
|item_id|references|null: false|
|creditCard_id|references|null: false|
### Association
- belongs_to :user

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null: false|
|ancestry|string|index: true|
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
- belongs_to :item

## credit_cardsテーブル(ユーザーのクレジットカード情報)
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false|
### Association
- belongs_to :user
このテーブルは、Paijpを検証してから不要かを決める。

## imagesテーブル(商品プレビューテーブル)
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false|
### Association
- belongs_to :user
- belongs_to :item