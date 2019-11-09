# require 'rails_helper'

# describe Residence do
#   describe '#create' do

#     #各項目空ではないか
#     it "is invalid without a address_number" do
#       user = build(:user, address_number: nil)
#       user.valid?
#       expect(user.errors[:address_number]).to include("入力してください")
#     end

#     it "is invalid without a prefecture_id" do
#       user = build(:user, prefecture_id: nil)
#       user.valid?
#       expect(user.errors[:prefecture_id]).to include("入力してください")
#     end

#     it "is invalid without a municipal" do
#       user = build(:user, municipal: nil)
#       user.valid?
#       expect(user.errors[:municipal]).to include("入力してください")
#     end

#     it "is invalid without a address" do
#       user = build(:user, address: nil)
#       user.valid?
#       expect(user.errors[:address]).to include("入力してください")
#     end

#     #address_numberのフォーマットが適切
#     it "is valid with a address_number that address number format" do
#       user = build(:user, address_number: "111-1111")
#       user.valid?
#       expect(user).to be_valid
#     end

#     #address_numberのフォーマットが不適切
#     it "is invalid with a address_number that address_number format" do
#       user = build(:user, address_number: "a11-1111")
#       user.valid?
#       expect(user.errors[:address_number]).to include("のフォーマットが不適切です")
#     end 

#     #prefecture_idが1~48の数字
#     it "is valid with a prefecture_id that has less than 48" do
#       user = build(:user, prefecture_id: "48")
#       user.valid?
#       expect(user).to be_valid
#     end

#     #prefecture_idが1~48の数字ではない
#     it "is invalid with a prefecture_id that has more than 49" do
#       user = build(:user, prefecture_id: "49")
#       user.valid?
#       expect(user.errors[:municipal])
#     end

#     #prefecture_idが数字のみではない
#     it "is invalid with a prfecture_id only integer" do
#       user = build(:user, prefecture_id: "aa")
#       user.valid?
#       expect(user.errors[:municipal])
#     end

#     #municipalが50文字以内
#     it "is valid with a municipal that has less than 50 characters" do
#       user = build(:user, municipal: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
#       user.valid?
#       expect(user).to be_valid
#     end

#     #municipalが50文字以上
#     it "is invalid with a municipal that has more than 51 characters" do
#       user = build(:user, municipal: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
#       user.valid?
#       expect(user.errors[:municipal]).to include("は50文字以内で入力してください") 
#     end

#     #addressが100文字以内
#     it "is valid with a address that has less than 100 characters" do
#       user = build(:user, address: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
#       user.valid?
#       expect(user).to be_valid
#     end

#     #addressが100文字以上
#     it "is invalid with a address that has more than 101 characters" do
#       user = build(:user, address: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
#       user.valid?
#       expect(user.errors[:address]).to include("は100文字以内で入力してください") 
#     end

#   end
# end
