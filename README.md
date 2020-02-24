# メルカリ コピーサイト

## 製作
65期チームB

# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|name|||
|email|string|null: false, unique: true|
|password|string|null: false|
### Association
- has_many :items
- has_many :comments

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
|saler_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
### Association
- has_many :comments
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :items