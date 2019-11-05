class Residence < ApplicationRecord

  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
#validation

  VALID_POST_CODE = /\A[0-9]{3}-[0-9]{4}\z/

  #address_number 空ではないか、最大8文字、フォーマットが適切か
  validates :address_number, presence: true, length: { maximum: 8 }, format: { with: VALID_POST_CODE, message: "フォーマットが不適切です"}
  #prefecture_id 空ではないか、prefecture_idに存在するものか
  validates :prefecture_id, presence: true, numericality: { only_integer: true, less_than: 49 }
  #munisipal 空ではないか、最大50文字
  validates :municipal, presence: true, length: { maximum: 50 }
  #address 空ではないか、最大100文字
  validates :address, presence: true, length: { maximum: 100 }
end
