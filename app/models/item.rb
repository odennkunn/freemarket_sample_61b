class Item < ApplicationRecord
  belongs_to :user
  belongs_to :bland
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  accepts_nested_attributes_for :images
end