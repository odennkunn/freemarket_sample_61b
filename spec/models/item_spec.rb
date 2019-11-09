require 'rails_helper'

describe Item do
  describe '#create' do

    it "is invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a explanation" do
      item = build(:item, explanation: nil)
      item.valid?
      expect(item.errors[:explanation]).to include("can't be blank")
    end
    
    it "is invalid without a price" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "is invalid without select status" do
      item = build(:item, status: "--")
      item.valid?
      expect(item.errors[:status]).to include("is reserved")
    end

    it "is invalid without a size" do
      item = build(:item, size: nil)
      item.valid?
      expect(item.errors[:size]).to include("can't be blank")
    end

    it "is invalid without select delivery_fee" do
      item = build(:item, delivery_fee: "--")
      item.valid?
      expect(item.errors[:delivery_fee]).to include("is reserved")
    end

    it "is invalid without select delivery_way" do
      item = build(:item, delivery_way: "--")
      item.valid?
      expect(item.errors[:delivery_way]).to include("is reserved")
    end

    it "is invalid without select delivery_day" do
      item = build(:item, delivery_day: "--")
      item.valid?
      expect(item.errors[:delivery_day]).to include("is reserved")
    end
  end
end