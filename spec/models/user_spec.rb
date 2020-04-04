require 'rails_helper'
describe User do
  describe '#create' do

    it "ニックネーム、メールアドレス、パスワード、確認用パスワード、名字、名前、名字(かな)、名前(かな)、誕生日が存在すれば登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "ニックネームが空では登録できない" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "メールアドレスが空では登録できない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "メールアドレスは@とドメインを含んでいなければ登録できない" do
      user = build(:user, email: "aaagmail")
      user.valid?
      expect(user.errors[:email]).to include("は@とドメインを含んだものを入力してください")
    end

    it "メールアドレスは重複して登録できない" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "パスワードが空では登録できない" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "パスワードは半角英数字でなければ登録できない" do
      user = build(:user, password: "test１２３４")
      user.valid?
      expect(user.errors[:password]).to include("は半角英数字で入力してください")
    end

    it "確認用パスワードと元のパスワードが一致しなければ登録できない" do
      user = build(:user, password:"0000000", password_confirmation: "1111111")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "パスワードは7文字以上ならば登録できる" do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    it "パスワードは6文字以下ならば登録できない" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it "名字が空では登録できない" do
      user = build(:user, family_name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    it "名字は全角でなければ登録できない" do
      user = build(:user, family_name: "yamada")
      user.valid?
      expect(user.errors[:family_name]).to include("は全角で入力してください")
    end

    it "名前が空では登録できない" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "名前は全角でなければ登録できない" do
      user = build(:user, first_name: "taro")
      user.valid?
      expect(user.errors[:first_name]).to include("は全角で入力してください")
    end

    it "名字(かな)が空では登録できない" do
      user = build(:user, family_name_kana: "")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください")
    end

    it "名字(かな)は全角ひらがなでなければ登録できない" do
      user = build(:user, family_name_kana: "ヤマダ")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は全角ひらがなで入力してください")
    end

    it "名前(かな)が空では登録できない" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "名前(かな)は全角ひらがなでなければ登録できない" do
      user = build(:user, first_name_kana: "太郎")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は全角ひらがなで入力してください")
    end

    it "誕生日が空では登録できない" do
      user = build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end
  end
end