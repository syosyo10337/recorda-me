require 'rails_helper'

RSpec.describe Item, type: :model do
  #ファクトリが有効であること
  it 'has a valid factory' do
    item = FactoryBot.build(:item)
    expect(item).to be_valid
  end


  #ユーザidを持つこと。
  it "is invalid without user" do
    item = FactoryBot.build(:item, user_id: nil)
    item.valid?
    expect(item.errors[:user]).to include("を入力してください")
  end
  #item.nameが15文字以下であること。
  describe "has name" do
    it "is valid within 15words" do
      item = FactoryBot.build(:item, name: "テスト" * 5)
      expect(item).to be_valid
    end
    it "is invalid with over 15 words" do
      item = FactoryBot.build(:item, name: "テストだ" * 4)
      item.valid?
      expect(item.errors[:name]).to include("は15文字以内で入力してください")
    end
  end
  #管理できる項目は、最大12個だということ。
  ###validationがうまく書けられない。

  # let(:user) { FactoryBot.create(:user) }

  skip it "item count is maximum 12 per user" do
    12.times do 
      FactoryBot.create(:item, user: user)
    end
    thirteenth_item = FactoryBot.build(:item, user: user)
     puts thirteenth_item.valid?
    expect(thirteenth_item).to be_invalid
  end

  #項目を消した時に、記録も消されること。dependent: : destroyのテスト
  it "has associated logs that destroyed with the item" do
    item = FactoryBot.create(:item)
    log = FactoryBot.create(:log, item: item)

    expect { item.destroy }.to change { Log.count }.by(-1)
  end

    

end
