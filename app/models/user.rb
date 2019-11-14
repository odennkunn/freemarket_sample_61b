class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :comments, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :credit_cards, dependent: :destroy
  has_one :residence, dependent: :destroy
  accepts_nested_attributes_for :residence 
  has_many :sns_credentials, dependent: :destroy
  
#varidation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{7,128}+\z/i
 

#user
  #nickname 空ではないか、最大20文字、一意制約
  # validates :nickname, presence: true, uniqueness: true, length: { maximum: 20 }
  #email 空ではないか、適切なフォーマットであるか、一意制約
  # validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: "フォーマットが不適切です"}
  #password 空ではないか、7文字以上128文字以下、半角英数字両方を含んでいるか
  #validates :password, presence: true, length: { in: 7..128 }, format: { with: VALID_PASSWORD_REGEX, message: "英字と数字両方を含むパスワードを設定してください"}, unless: -> { validation_context == :update }
  #password_confrimation 空ではないか、7文字以上128文字以下、半角英数字両方を含んでいるか
  #validates :password_confirmation, presence: true, length:{ in: 7..128 }, format: { with: VALID_PASSWORD_REGEX, message: "英字と数字両方を含むパスワードを設定してください"}, unless: -> { validation_context == :update }
  #family_name 空ではないか、最大35文字
  #validates :family_name, presence: true, length: { maximum: 35 }
  #last_name 空ではないか、最大35文字
  #validates :last_name, presence: true, length: { maximum: 35 }
  #kana_family_name 空ではないか、最大35文字、全角カナであるか
  #validates :kana_family_name, presence: true, length: { maximum: 35 }, format: { with: VALID_KATAKANA_REGEX, message: "カタカナで入力してください"}
  #kana_last_name 空ではないか、最大35文字、全角カナであるか
  #validates :kana_last_name, presence: true, length: { maximum: 35 }, format: { with: VALID_KATAKANA_REGEX, message: "カタカナで入力してください"}
  #birth_year 空ではないか、数値であるか、４桁のみ
  #validates :birth_year, presence: true, numericality: true, length: { is: 4 }
  #birth_month 空ではないか、数値であるか、1~2桁のみ
  #validates :birth_month, presence: true, numericality: true, length: { in: 1..2 }
  #birth_day 空ではないか、数値であるか、1~2桁のみ
  #validates :birth_day, presence: true, numericality: true, length: { in: 1..2 }

  #sns認証
  def self.without_sns_data(auth) #snsdataがない時
    user = User.where(email: auth.info.email).first  #userにsnsから取ってきたemailを代入して判断？

      if user.present? #authで取ってきたemailのuserが存在していたら
        sns = SnsCredential.create(
          uid: auth.uid,  #provider側で管理しているid
          provider: auth.provider,  #googleとかfacebookのこと
          user_id: user.id #これらの3つをcreateする
        )
      else
        user = User.new(
          nickname: auth.info.name,   #存在していなければauthからnicknameにnameを代入
          email: auth.info.email,   #emailにsnsのemailを代入
          password: Devise.friendly_token.first(7) #passwordはdeviseの自動生成を
        )
        sns = SnsCredential.new(
          uid: auth.uid,      #uidをnew
          provider: auth.provider #providerをnew
        )
      end
      return { user: user ,sns: sns}  #生成したuserをsnsをハッシュ型で返す

    end

   def self.with_sns_data(auth, snscredential) #snsdataがある時
    user = User.where(id: snscredential.user_id).first #sns_credentialからuser_idを元に探してくる
    unless user.present? #userが存在しなければ
      user = User.new(
        nickname: auth.info.name,
        email: auth.info.email,
        password: Devise.friendly_token.first(7) #authからnickname,emailを取ってくる。 passwordは自動生成
      )
    end
    return {user: user} #sns_dataはあるからuserの情報だけ
   end

   def self.find_oauth(auth)
    uid = auth.uid  #uidにauthから取得したuidを代入
    provider = auth.provider #providerを代入
    snscredential = SnsCredential.where(uid: uid, provider: provider).first #sns登録情報があるか
    if snscredential.present? #snscredentialがある時
      user = with_sns_data(auth, snscredential)[:user] #user情報をwith_sns_dataメソッドをつかって代入
      sns = snscredential #snsに情報を代入
    else
      user = without_sns_data(auth)[:user] #snscredentialがないため、without_sns_dataメソッドを使ってuser情報を取得
      sns = without_sns_data(auth)[:sns] #snscredentialがないため、without_sns_dataメソッドを使ってsns情報を取得
    end
    return { user: user ,sns: sns} #取得した情報をハッシュ型で返す
  end

end
