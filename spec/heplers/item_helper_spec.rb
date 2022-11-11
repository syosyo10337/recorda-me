require 'rails_helper'

RSpec.describe ItemHelper, type: :helper do

  it 'item_num' do
    user = FactoryBot.create(:user, :with_items)
    twelfth_item = user.items.last
    expect(helper.item_num(twelfth_item)).to eq 12
  end
end