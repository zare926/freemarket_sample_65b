require 'rails_helper'

describe Item, type: :model do
  describe '#update' do
    context '更新できる場合' do

      it "itemがすべて存在してあれば更新できる" do
        item = build(:item)
        expect(item).to be_valid
      end

      it "name,status,description,state,postage,prefecture,shipping_date,price,user_id,category_idがあれば更新できる" do
        expect(build(:item, brand: "")).to be_valid
      end

      it "priceが300円以上であれば更新できる" do
        item = build(:item, price: 300)
        expect(item).to be_valid
      end

      it "priceが9,999,999円以下であれば更新できる" do
        item = build(:item, price: 9999999)
        expect(item).to be_valid
      end

    end

    context "更新できない場合" do

      it "nameが入らないと更新できない" do
        item = build(:item, name: "")
        item.valid?
        expect(item.errors[:name]).to include("入力してください")
      end
  
      it "statusが入らないと更新できない" do
        item = build(:item, status: "")
        item.valid?
        expect(item.errors[:status]).to include("選択してください")
      end
  
      it "descriptionが入らないと更新できない" do
        item = build(:item, description: "")
        item.valid?
        expect(item.errors[:description]).to include("入力してください")
      end
  
      it "stateが入らないと更新できない" do
        item = build(:item, state: "")
        item.valid?
        expect(item.errors[:state]).to include("選択してください")
      end
  
      it "postageが入らないと更新できない" do
        item = build(:item, postage: "")
        item.valid?
        expect(item.errors[:postage]).to include("選択してください")
      end
  
      it "prefectureが入らないと更新できない" do
        item = build(:item, prefecture: "")
        item.valid?
        expect(item.errors[:prefecture]).to include("選択してください")
      end
  
      it "shipping_dateが入らないと更新できない" do
        item = build(:item, shipping_date: "")
        item.valid?
        expect(item.errors[:shipping_date]).to include("選択してください")
      end
  
      it "priceが入らないと更新できない" do
        item = build(:item, price: 100)
        item.valid?
        expect(item.errors[:price]).to include("入力してください")
      end

      it "priceが299円以下であれば更新できない" do
        item = build(:item, price: 299)
        item.valid?
        expect(item.errors[:price]).to include("は300円以上入力してください")
      end

      it "priceが10,000,000円以上であれば更新できない" do
        item = build(:item, price: 10000000)
        item.valid?
        expect(item.errors[:price]).to include("は9,999,999円以下入力してください")
      end

      it "categoryが入らないと更新できない" do
        item = build(:item, category_id: "")
        item.valid?
        expect(item.errors[:category_id]).to include("選択してください")
      end

      it "user_idがないと更新できない" do
        item = build(:item, user_id: "")
        item.valid?
        expect(item.errors[:user_id]).to include("を入力してください")
      end
    end
  end
end