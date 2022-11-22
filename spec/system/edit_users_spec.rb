require 'rails_helper'

RSpec.describe 'EditUsers', js: true, type: :system do
  include LoginSupport
  let(:user) { FactoryBot.create(:user) }

  before do
    login_as user
    visit edit_user_registration_path
  end

  it 'a user can edit himself' do
    fill_in 'ユーザ名', with: 'test name'
    fill_in 'user_current_password', with: user.password
    click_on '更新する'

    expect(page).to have_content 'アカウント情報を変更しました。'
  end

  it 'a user can delte himself' do
    expect do
      click_on 'アカウントを削除'

      page.accept_confirm

      expect(page).to have_content 'アカウントを削除しました。'
    end.to change { User.count }.by(-1)
  end
end
