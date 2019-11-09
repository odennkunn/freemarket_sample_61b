require 'rails_helper'

describe User do
  describe '#create' do

#各項目空ではないか
    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname])
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email])
    end

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password])
    end

    it "is invalid without a password_confirmation" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation])
    end

    it "is invalid without a family_name" do
      user = build(:user, family_name: "")
      user.valid?
      expect(user.errors[:family_name])
    end

    it "is invalid without a last_name" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name])
    end

    it "is invalid without a kana_family_name" do
      user = build(:user, kana_family_name: "")
      user.valid?
      expect(user.errors[:kana_family_name])
    end

    it "is invalid without a kana_last_name" do
      user = build(:user, kana_last_name: "")
      user.valid?
      expect(user.errors[:kana_last_name])
    end

    it "is invalid without a birth_year" do
      user = build(:user, birth_year: "")
      user.valid?
      expect(user.errors[:birth_year])
    end

    it "is invalid without a birth_month" do
      user = build(:user, birth_month: "")
      user.valid?
      expect(user.errors[:birth_month])
    end

    it "is invalid without a birth_day" do
      user = build(:user, birth_day: "")
      user.valid?
      expect(user.errors[:birth_day])
    end

#nickname 20文字以内なら登録
    it "is valid with a nickname that has less than 20 characters" do
      user = build(:user, nickname: 'aaaaaaaaaaaaaaaaaaaa')
      expect(user).to be_valid
    end

#nickname 20文字以上なら登録できない
    it "is invalid with a nickname that has more than 20 characters" do
      user = build(:user, nickname: 'aaaaaaaaaaaaaaaaaaaaa')
      user.valid?
      expect(user.errors[:nickname])
    end

#nickname 重複した場合登録できない
    it "is invalid with a duplicate nickname" do
      user = create(:user)
      another_user = build(:user, nickname: user.nickname)
      another_user.valid?
      expect(another_user.errors[:nickname])
    end

#emailが適切なフォーマットである
    it "is valid with a email wrong format" do
      user = build(:user, email: "11111111")
      user.valid?
      expect(user.errors[:email])
    end

#emailが重複した場合登録できない
    it "is invalid with a duplicate email" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email])
    end

#passwordが7~128文字であるか
  #passwordが7文字以上
      it "is valid with a password that has more than 7 characters" do
        user = build(:user, password: "abc1234", password_confirmation: "abc1234")
        user.valid?
        expect(user).to be_valid
      end

  #passwordが7文字未満
      it "is invalid with a password that less than 6 characters" do
        user = build(:user, password: "abc123", password_confirmation: "abc123")
        user.valid?
        expect(user.errors[:password])
      end
  
  #passwordが128文字以内
      it "is valid with a password that less than 128 characters" do
        user = build(:user, password: "abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234",
        password_confirmation: "abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234")
        user.valid?
        expect(user).to be_valid
      end

  #passwordが128文字以上
      it "is invalid with a password that more than 129 characters" do
        user = build(:user, password: "abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd12345",
        password_confirmation: "abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd12345")
        user.valid?
        expect(user.errors[:password])
      end

  #passwordに英数字が含まれている
      it "is valid with a password that contains letters and numbers" do
        user = build(:user, password: "abc1234", password_confirmation: "abc1234")
        user.valid?
        expect(user).to be_valid
      end

  #passwordが英語のみ
      it "is invalid with a password that only letters" do
        user = build(:user, password: "aaaabbb", password_confirmation: "aaaabbb")
        user.valid?
        expect(user.errors[:password][0])
      end

  #passwordが数字のみ
      it "is invalid with a password that only numbers" do
        user = build(:user, password: "1111222", password_confirmation: "1111222")
        user.valid?
        expect(user.errors[:password][0])
      end

  #passwordとpassword_confirmationが一致している
      it "is valid with a password and password_confirmation match" do
        user = build(:user, password: "aaaa111", password_confirmation: "aaaa111")
        user.valid?
        expect(user).to be_valid
      end

  #passwordとpassword_confirmationが一致していない
      it "is valid with a password and password_confirmation match" do
        user = build(:user, password: "aaaa123", password_confirmation: "aaaa111")
        user.valid?
        expect(user.errors[:password_confirmation][0])
      end

  #family_nameが35文字以内
      it "is valid with a family_name that has less than 35 characters" do
        user = build(:user, family_name: "あああああああああああああああああああああああああああああああああああ")
        user.valid?
        expect(user).to be_valid
      end
  #family_nameが36文字以上
      it "is invalid with a family_name that has more than 36 characters" do
        user = build(:user, family_name: "ああああああああああああああああああああああああああああああああああああ")
        user.valid?
        expect(user.errors[:family_name])
      end

  #last_nameが35文字以内
      it "is valid with a last_name that has less than 35 characters" do
        user = build(:user, last_name: "あああああああああああああああああああああああああああああああああああ")
        user.valid?
        expect(user).to be_valid
      end

  #last_nameが36文字以上
      it "is invalid with a last_name that has more than 36 characters" do
        user = build(:user, last_name: "ああああああああああああああああああああああああああああああああああああ")
        user.valid?
        expect(user.errors[:last_name])
      end
  #kana_family_nameが35文字以内
      it "is valid with a kana_family_name that has less than 35 characters" do
        user = build(:user, kana_family_name: "アアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアア")
        user.valid?
        expect(user).to be_valid
      end

  #kana_family_nameが36文字以上
      it "is invalid with a kana_family_name that has more than 36 characters" do
        user = build(:user, kana_family_name: "アアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアア")
        user.valid?
        expect(user.errors[:kana_family_name])
      end

  #kana_last_nameが35文字以内
      it "is valid with a kana_last_name that has less than 35 characters" do
        user = build(:user, kana_last_name: "アアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアア")
        user.valid?
        expect(user).to be_valid
      end

  #kana_last_nameが36文字以上
      it "is invalid with a kana_last_name that has more than 36 characters" do
        user = build(:user, kana_last_name: "アアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアア")
        user.valid?
        expect(user.errors[:kana_last_name])
      end

  #kana_family_nameが全角カナである
      it "is valid with a kana_family_name that kana" do
        user = build(:user, kana_family_name: "ア")
        user.valid?
        expect(user).to be_valid
      end

  #kana_family_nameが全角カナではない
      it "is invalid with a kana_family_name that kana" do
        user = build(:user, kana_family_name: "あ")
        user.valid?
        expect(user.errors[:kana_family_name][0])
      end
      
  #kana_last_nameが全角カナである
      it "is valid with a kana_last_name that kana" do
        user = build(:user, kana_last_name: "ア")
        user.valid?
        expect(user).to be_valid
      end

  #kana_last_nameが全角カナではない
      it "is invalid with a kana_last_name that kana" do
        user = build(:user, kana_last_name: "あ")
        user.valid?
        expect(user.errors[:kana_last_name][0])
      end


  #phone_numberのフォーマットが適切
      it "is valid with a phone_number that phone number format" do
        user = build(:user, phone_number: "08012345678")
        user.valid?
        expect(user).to be_valid
      end

  #phone_numberのフォーマットが不適切
      it "is invalid with a phone_number that phone number format" do
        user = build(:user, phone_number: "a8012345678")
        user.valid?
        expect(user.errors[:phone_number][0])
      end
  end
end
