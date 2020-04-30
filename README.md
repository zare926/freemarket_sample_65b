# FURIMA(メルカリコピーサイト)
[![Screenshot from Gyazo](https://gyazo.com/d395cd316aef2e7cd587d6124d108052/raw)](https://gyazo.com/d395cd316aef2e7cd587d6124d108052)

# 概要
プログラミングスクールTECH::CAMP65期チームBによる最終課題製作物。スクラムによるアジャイル開発により製作致しました。

# リンク
### URL：http://18.176.226.77/

Basic認証をかけているため、以下のID/PASSを入力してください。

## ID/PASS
- ID：admin
- PASS：2222

# テスト用アカウント
## 購入者アカウント
- メール：buyer_user@gmail.com
- パスワード：buyer_user

## 購入用カード情報
- 番号：
- 期限：
- セキュリティコード：

## 出品者用アカウント
- メール：saller_user@gmail.com
- パスワード：saller_user

# 詳細
- アプリ名：FURIMA
- 開発人数：6名
- 製作チーム：65期チームB
- 作業期間：約10週間

## 使用技術
- 言語・フレームワーク等：HTML(Haml)/CSS(scss)/Ruby/Ruby on Rails/JavaScript/jQuery/MySQL/Github/AWS/Visual Studio Code
- タスク管理：Trello

## 機能の詳細
### トップページ
### 商品出品機能
### 商品詳細機能
### 商品購入確認機能
### 商品情報編集機能
### 新規会員登録・ログイン機能
### ユーザーマイページ機能

# DB設計
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