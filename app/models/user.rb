class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :credit_cards, dependent: :destroy
  has_one :residence, dependent: :destroy
  accepts_nested_attributes_for :residence 
  
#varidation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{7,128}+\z/i
 

#user
  #nickname 空ではないか、最大20文字、一意制約
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 20 }
  #email 空ではないか、適切なフォーマットであるか、一意制約
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: "フォーマットが不適切です"}
  #password 空ではないか、7文字以上128文字以下、半角英数字両方を含んでいるか
  validates :password, presence: true, length: { in: 7..128 }, format: { with: VALID_PASSWORD_REGEX, message: "英字と数字両方を含むパスワードを設定してください"}
  #password_confrimation 空ではないか、7文字以上128文字以下、半角英数字両方を含んでいるか
  validates :password_confirmation, presence: true, length:{ in: 7..128 }, format: { with: VALID_PASSWORD_REGEX, message: "英字と数字両方を含むパスワードを設定してください"}
  #family_name 空ではないか、最大35文字
  validates :family_name, presence: true, length: { maximum: 35 }
  #last_name 空ではないか、最大35文字
  validates :last_name, presence: true, length: { maximum: 35 }
  #kana_family_name 空ではないか、最大35文字、全角カナであるか
  validates :kana_family_name, presence: true, length: { maximum: 35 }, format: { with: VALID_KATAKANA_REGEX, message: "カタカナで入力してください"}
  #kana_last_name 空ではないか、最大35文字、全角カナであるか
  validates :kana_last_name, presence: true, length: { maximum: 35 }, format: { with: VALID_KATAKANA_REGEX, message: "カタカナで入力してください"}
  #birth_year 空ではないか、数値であるか、４桁のみ
  validates :birth_year, presence: true, numericality: true, length: { is: 4 }
  #birth_month 空ではないか、数値であるか、2桁のみ
  validates :birth_month, presence: true, numericality: true, length: { is: 2 }
  #birth_day 空ではないか、数値であるか、2桁のみ
  validates :birth_day, presence: true, numericality: true, length: { is: 2 }
  #phone_number 空ではないか、フォーマットが適切であるか
  validates :phone_number, presence: true, format: { with: /\A0[7-9]0-?\d{4}-?\d{4}\z/, message: "入力が正しくありません"}


#residence

  #address_number 空ではないか、最大8文字、フォーマットが適切か
  #validates :address_number, presence: true, length: { maximum: 8 }, format: { with: VALID_POST_CODE, message: "フォーマットが不適切です"}
  #prefecture_id 空ではないか、prefecture_idに存在するものか
  #validates :prefecture_id, presence: true, numericality: { only_integer: true, less_than: 49 }
  #munisipal 空ではないか、最大50文字
  #validates :municipal, presence: true, length: { maximum: 50 }
  #address 空ではないか、最大100文字
  #validates :address, presence: true, length: { maximum: 100 }

end
