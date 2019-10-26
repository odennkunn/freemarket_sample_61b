# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false|
|password|string|null: false|
|family_name|string|null: false|
|last_name|string|null: false|
|kana_family_name|string|null: false|
|kana_last_name|string|null: false|
|prefecture|string|null: false|
|municipal|string|null: false|
|address|string|null: false|
|building|string|null: false|
|phone_number|string|null: false|

### association
  - has_many :comments
  - has_many :items, through: :user_items
  - has_many :user_items
  - has_many :credit_cards

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
|delivery_area|string|null: false|
|user_id|references|foreign_key: true|
|category_id|references|foreign_key: true|

### association
  - has_many :comments
  - has_many :image
  - has_many :users, through: :user_items
  - has_many :user_items
  - belongs_to :category
  - belongs_to :bland

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

## user_itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|items_id|references|foreign_key: true|

### association
  - belongs_to :item
  - belongs_to :user

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|expiration_date|integer|null: false|
|security_number|integer|null: false|
|user_id|references|foreign_key: true|

### association
  - belongs_to :user

## blandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### association
  - has_many :items



