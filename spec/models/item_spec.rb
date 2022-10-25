require 'rails_helper'

RSpec.describe Item, type: :model do
  it 
  
  it 'has a valid factory' do
    item = FactoryBot.build(:item)
    expect(item).to be_valid
  end
  #ユーザidを持つこと。
  #item.nameが15文字以下であること。
  #項目を消した時に、記録も消されること。
  #モテる項目は、最大12個だということ。
end
