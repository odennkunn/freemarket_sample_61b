class Residence < ApplicationRecord
  has_many :users, through: :user_residences
  has_many :user_residences
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
