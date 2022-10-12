require 'rails_helper'

RSpec.describe User, type: :model do
  #名前とメールとパスワードがあるとき有効であること
  it "is valid with email,name and password" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  describe "have name" do
    #名前がないと保存されないこと。
    it "can not be blank" do
      user = FactoryBot.build(:user, name: nil)
      user.valid?
      expect(user.errors.full_messages).to include("ニックネームを入力してください")
    end
    #30文字以内に収まること
    it "is too long when the length is over 30 chars" do
      user = FactoryBot.build(:user, name: "あ" * 31 )
      user.valid?
      expect(user.errors.full_messages).to include("ニックネームは30文字以内で入力してください")
    end
  end

  describe "have email" do
    #(deviseの存在性バリデーションを確認)。
    it "can not be blank" do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors.full_messages).to include("メールアドレスを入力してください")
    end
    
    #deviseの一意性の確認
    it "is unique" do
      user1 = FactoryBot.create(:user, email: "test@example.com")
      #devise/lib/devise/models/authenticatable.rbにてvalidation前に小文字に統一している
      user2 = FactoryBot.build(:user, email: "TEST@example.com")
      user2.valid?
      expect(user2.errors.full_messages).to include("メールアドレスはすでに存在します")
    end

    #データベースに小文字へ保存されること
    it "is saved in lowercase" do
      user = FactoryBot.create(:user, email: "TEST@ExaMpLE.coM")
      expect(user.reload.email).to eq "test@example.com"
    end
  end

  describe "have password" do
    #パスワードが空でないこと
    it "can not be blank" do
      user = FactoryBot.build(:user, password: nil)
      user.valid?
      expect(user.errors.full_messages).to include("パスワードを入力してください")
    end
    #最低文字数が8文字であること
    it 'is too short when the length is less than 8 chars ' do
      user = FactoryBot.build(:user, password: "a" * 7)
      user.valid?
      expect(user.errors.full_messages).to include("パスワードは8文字以上で入力してください")
    end

    
  end


end
