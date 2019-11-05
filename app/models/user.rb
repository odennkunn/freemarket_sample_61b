class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :credit_cards, dependent: :destroy
  has_many :residences, through: :user_residences, dependent: :destroy
  has_many :user_residences, dependent: :destroy
end
