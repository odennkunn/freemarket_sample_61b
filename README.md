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
  - https://github.com/kuwa1
  - https://github.com/kamiya-s-max
  - https://github.com/tawadmasanori

## ER図
<img width="916" alt="スクリーンショット 2019-11-16 14 19 52" src="https://user-images.githubusercontent.com/55783692/68988648-0621c780-087e-11ea-9da6-41c6449afa68.png">


## DB設計

### usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|family_name|string|null: false|
|last_name|string|null: false|
|kana_family_name|string|null: false|
|kana_last_name|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|phone_number|integer|
|introduction|text|

#### association
  - has_many :comments, dependent: :destroy
  - has_many :items, dependent: :destroy
  - has_many :credit_cards, dependent: :destroy
  - has_many :sns_credentials, dependent: :destroy
  - has_one :residence, dependent: :destroy
  - belongs_to_active_hash :prefecture

### commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|references|foreign_key: true|
|items_id|references|foreign_key: true|

#### association
  - belongs_to :item
  - belongs_to :user

### itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: fasle|
|explanation|text|null: false|
|price|integer|null: false|
|size|integer|null: false|
|status|string|null: false|
|delivery_fee|integer|null: false|
|delivery_way|string|null: false|
|delivery_day|string|null: false|
|prefecture_id|string|null: false|
|user_id|references|foreign_key: true|
|category_id|references|foreign_key: true|
|bland_id|references|foreign_key: true|

#### association
  - has_many :comments, dependent: :destroy
  - has_many :image, dependent: :destroy
  - belongs_to :category
  - belongs_to :bland
  - belongs_to :user
  - belongs_to_active_hash :prefecture

### categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|

#### association
  - has_many :items

### imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
|image|string|null: false|

#### association
  - belongs_to :item

### credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

#### association
  - belongs_to :user

### blandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

#### association
  - has_many :items

### residencesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|prefecture_id|string|null: false|
|address_number|integer|null: false|
|municipal|string|null: false|
|address|string|null: false|
|building|string|

#### association
  - belongs_to :user
  - belongs_to_active_hash :prefectures

### sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|uid|string|
|provider|string|

#### association
  - belongs_to :user