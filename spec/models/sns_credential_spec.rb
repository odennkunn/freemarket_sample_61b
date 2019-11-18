require 'rails_helper'

describe SnsCredential, type: :model do
  describe '#create' do

    before do
      user = create(:user, id: 1)
    end

    #uid,provider,user_idがあれば登録できる
    it "is valid with a column" do
      sns = build(:sns_credential)
      expect(sns).to be_valid
    end

    #uidが空では登録できない
    it "is invalid without a uid" do
      sns = build(:sns_credential, uid: nil)
      sns.valid?
      expect(sns.errors[:uid]).to include("を入力してください")
    end

    #providerが空では登録できない
    it "is invalid without a provider" do
      sns = build(:sns_credential, provider: nil)
      sns.valid?
      expect(sns.errors[:provider]).to include("を入力してください")
    end

    #user_idが空では登録できない
    it "is invalid without a user_id" do
      sns = build(:sns_credential, user_id: nil)
      sns.valid?
      expect(sns.errors[:user_id]).to include("を入力してください")
    end

  end
end
