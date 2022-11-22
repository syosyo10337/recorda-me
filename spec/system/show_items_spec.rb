require 'rails_helper'

RSpec.describe 'ShowItems', js: true, type: :system do
  include LoginSupport
  include ItemHelper
  let(:user) { FactoryBot.create(:user) }
  let!(:item) { FactoryBot.create(:named_item, user: user) }

  3.times do
    let!(:log) { FactoryBot.create(:log, item: item) }
  end

  it 'access from logged_in home page' do
    login_as user

    click_on item.name
    expect(page).to have_content item.name
    expect(page).to have_css 'li.item-bg-1'
    expect(page).to have_content '今日の活動を記録しよう'
  end

  it "access from item's index page" do
    login_as user
    visit items_path
    click_on item.name
    expect(page).to have_content item.name
    expect(page).to have_css 'li.item-bg-1'
    expect(page).to have_content '今日の活動を記録しよう'
  end
end
