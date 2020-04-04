require 'rails_helper'
describe Address do
  describe '#create_address' do
    it "送付先氏名の名字、名前、名字(かな)、名前(かな)、郵便番号、都道府県、市区町村、番地が存在すれば登録できる" do
      address = build(:address)
      expect(address).to be_valid
    end
  
    it "送付先氏名の名字は空では登録できない" do
      address = build(:address, address_family_name: "")
      address.valid?
      expect(address.errors[:address_family_name]).to include("を入力してください")
    end

    it "送付先氏名の名字は全角でなければ登録できない" do
      user = build(:address, address_family_name: "yamada")
      user.valid?
      expect(user.errors[:address_family_name]).to include("は全角で入力してください")
    end

    it "送付先氏名の名前が空では登録できない" do
      user = build(:address, address_first_name: "")
      user.valid?
      expect(user.errors[:address_first_name]).to include("を入力してください")
    end

    it "送付先氏名の名前は全角でなければ登録できない" do
      user = build(:address, address_first_name: "taro")
      user.valid?
      expect(user.errors[:address_first_name]).to include("は全角で入力してください")
    end

    it "送付先氏名の名字(かな)が空では登録できない" do
      user = build(:address, address_family_name_kana: "")
      user.valid?
      expect(user.errors[:address_family_name_kana]).to include("を入力してください")
    end

    it "送付先氏名の名字(かな)は全角ひらがなでなければ登録できない" do
      user = build(:address, address_family_name_kana: "ヤマダ")
      user.valid?
      expect(user.errors[:address_family_name_kana]).to include("は全角ひらがなで入力してください")
    end

    it "送付先氏名の名前(かな)が空では登録できない" do
      user = build(:address, address_first_name_kana: "")
      user.valid?
      expect(user.errors[:address_first_name_kana]).to include("を入力してください")
    end

    it "送付先氏名の名前(かな)は全角ひらがなでなければ登録できない" do
      user = build(:address, address_first_name_kana: "太郎")
      user.valid?
      expect(user.errors[:address_first_name_kana]).to include("は全角ひらがなで入力してください")
    end

    it "郵便番号は空では登録できない" do
      address = build(:address, postcode: "")
      address.valid?
      expect(address.errors[:postcode]).to include("を入力してください")
    end

    it "郵便番号は半角数字でないと登録できない" do
      user = build(:address, postcode: "１３３５５６７")
      user.valid?
      expect(user.errors[:postcode]).to include("はハイフンなしの7桁の半角数字で入力してください")
    end

    it "郵便番号はハイフンなしでないと登録できない" do
      user = build(:address, postcode: "133-5567")
      user.valid?
      expect(user.errors[:postcode]).to include("はハイフンなしの7桁の半角数字で入力してください")
    end

    it "郵便番号は6桁以下だと登録できない" do
      user = build(:address, postcode: "133556")
      user.valid?
      expect(user.errors[:postcode]).to include("はハイフンなしの7桁の半角数字で入力してください")
    end

    it "郵便番号は8桁以上だと登録できない" do
      user = build(:address, postcode: "13355678")
      user.valid?
      expect(user.errors[:postcode]).to include("はハイフンなしの7桁の半角数字で入力してください")
    end

    it "都道府県は選択してください以外を選ばないと登録できない" do
      user = build(:address, prefecture: "選択してください")
      user.valid?
      expect(user.errors[:prefecture]).to include("を選択してください")
    end

    it "市区町村は空では登録できない" do
      address = build(:address, address_city: "")
      address.valid?
      expect(address.errors[:address_city]).to include("を入力してください")
    end

    it "市区町村は全角でないと登録できない" do
      user = build(:address, address_city: "Tokyo")
      user.valid?
      expect(user.errors[:address_city]).to include("は全角で入力してください")
    end

    it "町名・番地は空では登録できない" do
      address = build(:address, address_block: "")
      address.valid?
      expect(address.errors[:address_block]).to include("を入力してください")
    end

    it "建物名・部屋番号は空でも登録できる" do
      address = build(:address, address_building: "")
      expect(address).to be_valid
    end

    it "電話番号は空でも登録できる" do
      address = build(:address, phone_number: "")
      expect(address).to be_valid
    end

    it "電話番号はハイフンなしでないと登録できない" do
      address = build(:address, phone_number: "090-1234-5678")
      address.valid?
      expect(address.errors[:phone_number]).to include("はハイフンなしの10桁または11桁の半角数字で入力してください")
    end

    it "電話番号は半角数字でないと登録できない" do
      address = build(:address, phone_number: "０９０-１２３４-５６７８")
      address.valid?
      expect(address.errors[:phone_number]).to include("はハイフンなしの10桁または11桁の半角数字で入力してください")
    end

    it "電話番号は10桁だと登録できる" do
      address = build(:address, phone_number: "0312345678")
      expect(address).to be_valid
    end

    it "電話番号は11桁だと登録できる" do
      address = build(:address, phone_number: "09012345678")
      expect(address).to be_valid
    end

    it "電話番号は9桁以下だと登録できない" do
      address = build(:address, phone_number: "031234567")
      address.valid?
      expect(address.errors[:phone_number]).to include("はハイフンなしの10桁または11桁の半角数字で入力してください")
    end

    it "電話番号は12桁以上だと登録できない" do
      address = build(:address, phone_number: "090123456789")
      address.valid?
      expect(address.errors[:phone_number]).to include("はハイフンなしの10桁または11桁の半角数字で入力してください")
    end
  end
end