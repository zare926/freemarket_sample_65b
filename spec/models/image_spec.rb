require 'rails_helper'
describe Item do
  describe '#show' do
    it "itemの中には必ず、imageが入らないといけない" do
     item = build(:item, image: "")
     item.valid?
     expect(item.errors[:image]).to include("画像がありません")
    end
  end
end