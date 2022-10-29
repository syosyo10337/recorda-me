require 'rails_helper'

RSpec.describe 'Items', type: :system, js: true do
  include LoginSupport

  let(:user) { FactoryBot.create(:user, :with_items) }

  scenario 'user edit a item name' do
    login_as(user)

    click_on '各種設定'
    click_on '活動項目'
    expect(page).to have_content '記録中の活動項目一覧'
    # 1つの目の項目を編集する
    find('#edit-item-1').click

    fill_in 'item_name', with: '新項目'
    click_on '更新する'

    expect(page).to have_content '名前を更新しました。'
    expect(page).to have_content '記録中の活動項目一覧'
    expect(page).to have_content '新項目'
    expect(user.items[0].reload.name).to eq '新項目'
  end
end
