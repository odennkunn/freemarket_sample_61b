require 'rails_helper'

describe Residence do
  describe '#create' do

    #各項目空ではないか
    it "is invalid without a address_number" do
      residence = build(:residence, address_number: "")
      residence.valid?
      expect(residence.errors[:address_number])
    end

    it "is invalid without a prefecture_id" do
      residence = build(:residence, prefecture_id: "")
      residence.valid?
      expect(residence.errors[:prefecture_id])
    end

    it "is invalid without a municipal" do
      residence = build(:residence, municipal: "")
      residence.valid?
      expect(residence.errors[:municipal])
    end

    it "is invalid without a address" do
      residence = build(:residence, address: "")
      residence.valid?
      expect(residence.errors[:address])
    end

    #address_numberのフォーマットが適切
    it "is valid with a address_number that address number format" do
      residence = build(:residence, address_number: "111-1111")
      residence.valid?
      expect(residence).to be_valid
    end

    #address_numberのフォーマットが不適切
    it "is invalid with a address_number that address_number format" do
      residence = build(:residence, address_number: "a11-1111")
      residence.valid?
      expect(residence.errors[:address_number])
    end 

    #prefecture_idが1~48の数字
    it "is valid with a prefecture_id that has less than 48" do
      residence = build(:residence, prefecture_id: "48")
      residence.valid?
      expect(residence).to be_valid
    end

    #prefecture_idが1~48の数字ではない
    it "is invalid with a prefecture_id that has more than 49" do
      residence = build(:residence, prefecture_id: "49")
      residence.valid?
      expect(residence.errors[:municipal])
    end

    #municipalが50文字以内
    it "is valid with a municipal that has less than 50 characters" do
      residence = build(:residence, municipal: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      residence.valid?
      expect(residence).to be_valid
    end

    #municipalが50文字以上
    it "is invalid with a municipal that has more than 51 characters" do
      residence = build(:residence, municipal: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      residence.valid?
      expect(residence.errors[:municipal]) 
    end

    #addressが100文字以内
    it "is valid with a address that has less than 100 characters" do
      residence = build(:residence, address: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      residence.valid?
      expect(residence).to be_valid
    end

    #addressが100文字以上
    it "is invalid with a address that has more than 101 characters" do
      residence = build(:residence, address: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      residence.valid?
      expect(residence.errors[:address])
    end
  end
end
