class Item < ApplicationRecord
  belongs_to :user
  belongs_to :bland
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  belongs_to_active_hash :perfecture

end
