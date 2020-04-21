require 'rails_helper'
describe Item do
  describe '#show' do
    it "itemの中には必ず、nameが入らないといけない" do
     item = build(:item, name: "")
     item.valid?
     expect(item.errors[:name]).to include("入力してください")
    end

    it "itemの中には必ず、statusが入らないといけない" do
      item = build(:item, status: "")
      item.valid?
      expect(item.errors[:status]).to include("選択してください")
    end

    it "itemの中には必ず、descriptionが入らないといけない" do
      item = build(:item, description: "")
      item.valid?
      expect(item.errors[:description]).to include("入力してください")
    end

    it "itemの中には必ず、stateが入らないといけない" do
      item = build(:item, state: "")
      item.valid?
      expect(item.errors[:state]).to include("選択してください")
    end

    it "itemの中には必ず、postageが入らないといけない" do
      item = build(:item, postage: "")
      item.valid?
      expect(item.errors[:postage]).to include("選択してください")
    end

    it "itemの中には必ず、prefectureが入らないといけない" do
      item = build(:item, prefecture: "")
      item.valid?
      expect(item.errors[:prefecture]).to include("選択してください")
    end

    it "itemの中には必ず、shipping_dateが入らないといけない" do
      item = build(:item, shipping_date: "")
      item.valid?
      expect(item.errors[:shipping_date]).to include("選択してください")
    end

    it "itemの中には必ず、priceが入らないといけない" do
      item = build(:item, price: 100)
      item.valid?
      expect(item.errors[:price]).to include("must be greater than or equal to 300")
    end
  end
  describe '#create' do
    it "itemの中には必ず、nameが入らないといけない" do
     item = build(:item, name: "")
     item.valid?
     expect(item.errors[:name]).to include("入力してください")
    end

    it "itemの中には必ず、statusが入らないといけない" do
      item = build(:item, status: "")
      item.valid?
      expect(item.errors[:status]).to include("選択してください")
    end

    it "itemの中には必ず、descriptionが入らないといけない" do
      item = build(:item, description: "")
      item.valid?
      expect(item.errors[:description]).to include("入力してください")
    end

    it "itemの中には必ず、stateが入らないといけない" do
      item = build(:item, state: "")
      item.valid?
      expect(item.errors[:state]).to include("選択してください")
    end

    it "itemの中には必ず、postageが入らないといけない" do
      item = build(:item, postage: "")
      item.valid?
      expect(item.errors[:postage]).to include("選択してください")
    end

    it "itemの中には必ず、shipping_dateが入らないといけない" do
      item = build(:item, shipping_date: "")
      item.valid?
      expect(item.errors[:shipping_date]).to include("選択してください")
    end

    it "itemの中には必ず、priceが入らないといけない" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("must be less than or equal to 300")
    end
  end
end