# freemarket_sample_61b
フリマアプリ「メルカリ」のクローンサイト

## Description
フリマアプリ「メルカリ」のクローンサイト。誰でも簡単に売り買いが楽しめるフリマアプリの機能を再現したページ。 ユーザー登録、商品出品、商品購入などの機能を再現。

## Features
  - haml/SASS記法と、命名規則BEMを使ったマークアップ
  - ウィザード形式を用いたユーザー登録フォーム
  - SNS認証による新規登録、ログイン
  - pay.jpによるクレジットカード登録機能、購入処理
  - capistranoによるAWS EC2への自動デプロイ
  - ActiveStorageを使用しAWS S3への画像アップロード
  - RSpecを使った単体テスト

## Contributors
  - https://github.com/odennkunn

## ER図
<img width="916" alt="スクリーンショット 2019-11-16 14 19 52" src="https://user-images.githubusercontent.com/55783692/68988648-0621c780-087e-11ea-9da6-41c6449afa68.png">


# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|family_name|string|null: false|
|last_name|string|null: false|
|kana_family_name|string|null: false|
|kana_last_name|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|phone_number|integer|
|residence_id|references|foreign_key: true|

### association
  - has_many :comments, dependent: :destroy
  - has_many :items, dependent: :destroy
  - has_many :credit_cards, dependent: :destroy
  - has_one :residence, dependent: :destroy

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|references|foreign_key: true|
|items_id|references|foreign_key: true|

### association
  - belongs_to :item
  - belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: fasle|
|explanation|text|null: false|
|price|integer|null: false|
|size|integer|null: false|
|status|string|null: false|
|delivery_fee|integer|null: false|
|prefecture_id|references|foreign_key: true|
|user_id|references|foreign_key: true|
|category_id|references|foreign_key: true|
|bland_id|references|foreign_key: true|
|delivery_way|string|null: false|
|delivery_day|string|null: false|

### association
  - has_many :comments, dependent: :destroy
  - has_many :image, dependent: :destroy
  - belongs_to_active_hash :prefecture
  - belongs_to :category
  - belongs_to :bland
  - belongs_to :user

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### association
  - has_many :items

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
|image|string|null: false|

### association
  - belongs_to :item

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### association
  - belongs_to :user

## blandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### association
  - has_many :items

## residencesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|address_number|integer|null: false|
|prefecture_id|references|foreign_key: true|
|municipal|string|null: false|
|address|string|null: false|
|building|string|

### association
  - belongs_to :user
  - belongs_to_active_hash :prefectures