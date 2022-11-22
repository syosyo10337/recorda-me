require 'rails_helper'

RSpec.describe 'EditItems', type: :system do
  include LoginSupport
  let(:user) { FactoryBot.create(:user, :with_items) }

  it 'user edit a item name' do
    login_as user

    click_on '各種設定'
    click_on '活動項目'
    expect(page).to have_content '記録中の活動項目一覧'
    # 1つの目の項目を編集する
    find_by_id('edit-item-1').click

    fill_in 'item_name', with: '新項目'
    click_on '更新する'

    expect(page).to have_content '名前を更新しました。'
    expect(page).to have_content '記録中の活動項目一覧'
    expect(page).to have_content '新項目'
    expect(user.items.first.reload.name).to eq '新項目'
  end

  describe 'user edit only items their own' do
    let(:other_user) { FactoryBot.create(:user, :with_items) }

    # GET /item/:id/editで他人の項目編集に入ろうとした時
    it 'when tring to visit other user items' do
      login_as user
      visit edit_item_path(other_user.items[0])
      expect(page).to have_content '権限のない操作です。'
      expect(page).to have_current_path root_path, ignore_query: true
    end
  end
end
