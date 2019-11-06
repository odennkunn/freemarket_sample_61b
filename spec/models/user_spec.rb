require 'rails_helper'

describe User do
  describe '#create' do
#各項目空ではないか

    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("入力してください")
    end

    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("入力してください")
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("入力してください")
    end

    it "is invalid without a password_confirmation" do
      user = build(:user, password_confirmation: nil)
      user.valid?
      expect(user.errors[:password_confirmation]).to include("入力してください")
    end

    it "is invalid without a family_name" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("入力してください")
    end

    it "is invalid without a last_name" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("入力してください")
    end

    it "is invalid without a kana_family_name" do
      user = build(:user, kana_family_name: nil)
      user.valid?
      expect(user.errors[:kana_family_name]).to include("入力してください")
    end

    it "is invalid without a kana_last_name" do
      user = build(:user, kana_last_name: nil)
      user.valid?
      expect(user.errors[:kana_last_name]).to include("入力してください")
    end

    it "is invalid without a birth_year" do
      user = build(:user, birth_year: nil)
      user.valid?
      expect(user.errors[:birth_year]).to include("入力してください")
    end

    it "is invalid without a birth_month" do
      user = build(:user, birth_month: nil)
      user.valid?
      expect(user.errors[:birth_month]).to include("入力してください")
    end

    it "is invalid without a birth_day" do
      user = build(:user, birth_day: nil)
      user.valid?
      expect(user.errors[:birth_day]).to include("入力してください")
    end

    it "is invalid without a phone_number" do
      user = build(:user, phone_number: nil)
      user.valid?
      expect(user.errors[:phone_number]).to include("入力してください")
    end

    # it "is invalid without a address_number" do
    #   user = build(:user, address_number: nil)
    #   user.valid?
    #   expect(user.errors[:address_number]).to include("入力してください")
    # end

    # it "is invalid without a prefecture_id" do
    #   user = build(:user, prefecture_id: nil)
    #   user.valid?
    #   expect(user.errors[:prefecture_id]).to include("入力してください")
    # end

    # it "is invalid without a municipal" do
    #   user = build(:user, municipal: nil)
    #   user.valid?
    #   expect(user.errors[:municipal]).to include("入力してください")
    # end

    # it "is invalid without a address" do
    #   user = build(:user, address: nil)
    #   user.valid?
    #   expect(user.errors[:address]).to include("入力してください")
    # end

#nickname 20文字以内なら登録
    it "is valid with a nickname that has less than 20 characters" do
      user = build(:user, nickname: 'aaaaaaaaaaaaaaaaaaaa')
      expect(user).to be_valid
    end

#nickname 20文字以上なら登録できない
    it "is invalid with a nickname that has more than 20 characters" do
      user = build(:user, nickname: 'aaaaaaaaaaaaaaaaaaaaa')
      user.valid?
      expect(user.errors[:nickname]).to include("20文字以内で入力してください")
    end

#nickname 重複した場合登録できない
    it "is invalid with a duplicate nickname" do
      user = create(:user)
      another_user = build(:user, nickname: user.nickname)
      another_user.valid?
      expect(another_user.errors[:nickname]).to include("すでに登録されているニックネームです")
    end

#emailが適切なフォーマットである
    it "is valid with a email wrong format" do
      user = build(:user, email: "11111111")
      user.valid?
      expect(user.errors[:email]).to include("フォーマットが不適切です")
    end

#emailが重複した場合登録できない
    it "is invalid with a duplicate email" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("すでに登録されているアドレスです")
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
        expect(user.errors[:password]).to include("7文字以上で入力してください")
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
        expect(user.errors[:password]).to include("128文字以内で入力してください")
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
        expect(user.errors[:password][0]).to include("英数字両方を含めて入力してください")
      end

  #passwordが数字のみ
      it "is invalid with a password that only numbers" do
        user = build(:user, password: "1111222", password_confirmation: "1111222")
        user.valid?
        expect(user.errors[:password][0]).to include("英数字両方を含めて入力してください")
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
        expect(user.errors[:password_confirmation][0]).to include("パスワードの入力が一致しません")
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
        expect(user.errors[:family_name]).to include("35文字以内で入力してください")
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
        expect(user.errors[:last_name]).to include("35文字以内で入力してください")
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
        expect(user.errors[:kana_family_name]).to include("35文字以内で入力してください")
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
        expect(user.errors[:kana_last_name]).to include("35文字以内で入力してください")
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
        expect(user.errors[:kana_family_name][0]).to include("はカタカナで入力して下さい") 
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
        expect(user.errors[:kana_last_name][0]).to include("はカタカナで入力して下さい") 
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
        expect(user.errors[:phone_number][0]).to include("の入力が正しくありません") 
      end

  # #address_numberのフォーマットが適切
  #     it "is valid with a address_number that address number format" do
  #       user = build(:user, address_number: "111-1111")
  #       user.valid?
  #       expect(user).to be_valid
  #     end

  # #address_numberのフォーマットが不適切
  #     it "is invalid with a address_number that address_number format" do
  #       user = build(:user, address_number: "a11-1111")
  #       user.valid?
  #       expect(user.errors[:address_number]).to include("のフォーマットが不適切です")
  #     end 

  # #prefecture_idが1~48の数字
  #     it "is valid with a prefecture_id that has less than 48" do
  #       user = build(:user, prefecture_id: "48")
  #       user.valid?
  #       expect(user).to be_valid
  #     end

  # #prefecture_idが1~48の数字ではない
  #     it "is invalid with a prefecture_id that has more than 49" do
  #       user = build(:user, prefecture_id: "49")
  #       user.valid?
  #       expect(user.errors[:municipal])
  #     end

  # #prefecture_idが数字のみではない
  #     it "is invalid with a prfecture_id only integer" do
  #       user = build(:user, prefecture_id: "aa")
  #       user.valid?
  #       expect(user.errors[:municipal])
  #     end

  # #municipalが50文字以内
  #     it "is valid with a municipal that has less than 50 characters" do
  #       user = build(:user, municipal: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
  #       user.valid?
  #       expect(user).to be_valid
  #     end

  # #municipalが50文字以上
  #     it "is invalid with a municipal that has more than 51 characters" do
  #       user = build(:user, municipal: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
  #       user.valid?
  #       expect(user.errors[:municipal]).to include("は50文字以内で入力してください") 
  #     end

  # #addressが100文字以内
  #     it "is valid with a address that has less than 100 characters" do
  #       user = build(:user, address: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
  #       user.valid?
  #       expect(user).to be_valid
  #     end

  # #addressが100文字以上
  #     it "is invalid with a address that has more than 101 characters" do
  #       user = build(:user, address: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
  #       user.valid?
  #       expect(user.errors[:address]).to include("は100文字以内で入力してください") 
  #     end

  end
end
