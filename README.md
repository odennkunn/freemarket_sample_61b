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
|birthday|date|null: false|
|phone_number|string|

### association
  - has_many :comments
  - has_many :items
  - has_many :user_items
  - has_many :credit_cards
  - has_many :residence, through: :user_residences
  - has_many :user_residences


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

## residencesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|address_number|integer|null: false|
|prefecture|string|null: false|
|municipal|string|null: false|
|address|string|null: false|
|building|string|

### association
  - has_many :users, through: :user_residences
  - has_many :user_residences

## user_residencesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|residence_id|references|foreign_key: true|

### association
  - belongs_to :user
  - belongs_to :residence