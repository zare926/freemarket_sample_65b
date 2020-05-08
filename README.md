# :package: FURIMA(メルカリコピーサイト)
[![Screenshot from Gyazo](https://gyazo.com/d395cd316aef2e7cd587d6124d108052/raw)](https://gyazo.com/d395cd316aef2e7cd587d6124d108052)

# :blue_book: 概要
プログラミングスクールTECH::CAMP65期チームBによる最終課題製作物。スクラムによるアジャイル開発により製作致しました。

# :blue_book: リンク
### URL：http://18.176.226.77/

Basic認証をかけているため、以下のID/PASSを入力してください。

## ID/PASS
- ID：admin
- PASS：2222

# :blue_book: テスト用アカウント
## 購入者アカウント
- メール：buyeruser0507@gmail.com
- パスワード：buyeruser0507

## 購入用カード情報
- 番号：30569309025904
- 期限：07/24
- セキュリティコード：123

## 出品者用アカウント
- メール：salleruser0507@gmail.com
- パスワード：salleruser0507

# :blue_book: 詳細
- アプリ名：FURIMA
- 開発人数：6名
- 製作チーム：65期チームB
- 作業期間：約10週間

## :iphone: 使用技術
- 言語・フレームワーク：HTML(Haml)/CSS(scss)/Ruby/Ruby on Rails/JavaScript/jQuery/MySQL/Github/AWS/Visual Studio Code
- タスク管理：Trello

## 機能の詳細
### トップページ
[![Screenshot from Gyazo](https://gyazo.com/d1f887088f30a687f059fbdb529e6caa/raw)](https://gyazo.com/d1f887088f30a687f059fbdb529e6caa)

### 商品出品機能
View
[![Screenshot from Gyazo](https://gyazo.com/82469034c317dea5cf6eb6cb4fc64779/raw)](https://gyazo.com/82469034c317dea5cf6eb6cb4fc64779)

### 商品詳細機能
View
[![Screenshot from Gyazo](https://gyazo.com/f03053da0c2b5d7df0d4c1b60b399186/raw)](https://gyazo.com/f03053da0c2b5d7df0d4c1b60b399186)

### 商品購入確認機能
[![Screenshot from Gyazo](https://gyazo.com/f0ee18bae5aa0d4662d562b20d84a7aa/raw)](https://gyazo.com/f0ee18bae5aa0d4662d562b20d84a7aa)

### 商品情報編集・削除機能
編集
[![Screenshot from Gyazo](https://gyazo.com/b928a1a2d6bd8c12d9a46f646ca5dc55/raw)](https://gyazo.com/b928a1a2d6bd8c12d9a46f646ca5dc55)

削除
[![Screenshot from Gyazo](https://gyazo.com/d2f307508d37b7b71bf1ff2c2f7cae39/raw)](https://gyazo.com/d2f307508d37b7b71bf1ff2c2f7cae39)


### 新規会員登録・ログイン機能
新規会員登録
[![Screenshot from Gyazo](https://gyazo.com/1b31b0bfa1205f20a17fbca29aff05ef/raw)](https://gyazo.com/1b31b0bfa1205f20a17fbca29aff05ef)

新規会員登録2
[![Screenshot from Gyazo](https://gyazo.com/01307aae2789a6dc6930af4c50c6b2a7/raw)](https://gyazo.com/01307aae2789a6dc6930af4c50c6b2a7)

ログイン
[![Screenshot from Gyazo](https://gyazo.com/cc652a8664b3673cddc652ec0a3d3da0/raw)](https://gyazo.com/cc652a8664b3673cddc652ec0a3d3da0)

### ユーザーマイページ機能
View
[![Screenshot from Gyazo](https://gyazo.com/95f7d9e808e25bda0389174a1c32524e/raw)](https://gyazo.com/95f7d9e808e25bda0389174a1c32524e)

ログアウト
[![Screenshot from Gyazo](https://gyazo.com/daebf0d2fa6898568535ad635f653410/raw)](https://gyazo.com/daebf0d2fa6898568535ad635f653410)

# :minidisc: DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|
|password|string|null: false|
|email|string|null:false, default: ""|
### Association
- has_one :address
- has_many :items
- has_many :images

## itemsテーブル(商品出品テーブル)
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index :true|
|status|integer|default: 0|
|description|text|null: false|
|brand|string||
|size|string||
|state|integer|null: false|
|postage|integer|null: false|
|prefecture|string|null: false|
|shipping_date|integer|null: false|
|price|integer|null: false|
|user_id|integer|null: false|
|buyer_id|integer||
|category_id|integer||
### Association
- has_many :images
- has_many :comments
- has_many :purchases
- belongs_to :user
- belongs_to :category
- accepts_nested_attributes_for :images, allow_destroy: true

## Purchasesテーブル(商品購入テーブル)
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## categoriesテーブル(商品カテゴリーテーブル)
|Column|Type|Options|
|------|----|-------|
|name|string||
|ancestry|string||
### Association
- has_many :items
- has_ancestry

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string||
|item_id|integer||
|user_id|integer||
### Association
- belongs_to :user
- belongs_to :item

## cardsテーブル(ユーザーのクレジットカード情報)
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|

## imagesテーブル(商品プレビューテーブル)
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|item_id|integer|null: false|
### Association
- belongs_to :item

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|address_family_name|string|null: false|
|address_first_name|string|null: false|
|address_family_name_kana|string|null: false|
|address_first_name_kana|string|null: false|
|postcode|string|null: false|
|prefecture|string|null: false|
|address_city|string|null: false|
|address_block|string|null: false|
|address_building|string||
|phone_number|string||
|user_id|references|null: false|
### Association
- belongs_to :user

## ER図
![](https://i.gyazo.com/1f1ab7c8e654507625070e4b34633b82.png)
- 使用ソフトウェア：Lucidchart