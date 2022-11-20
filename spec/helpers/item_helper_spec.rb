require 'rails_helper'

RSpec.describe ItemHelper, type: :helper do
  include Devise::Test::ControllerHelpers

  it 'item_num' do
    user = FactoryBot.create(:user, :with_items)
    sign_in user
    twelfth_item = user.items.last
    expect(helper.item_num(twelfth_item)).to eq 12
  end
end