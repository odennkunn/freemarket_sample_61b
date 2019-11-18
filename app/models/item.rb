class Item < ApplicationRecord
  belongs_to :user
  belongs_to :bland
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
  validates :status, exclusion: { in: %w(--) }
  validates :size, presence: true
  validates :delivery_fee, exclusion: { in: %w(--) }
  validates :delivery_way, exclusion: { in: %w(--) }
  validates :delivery_day, exclusion: { in: %w(--) }
end
