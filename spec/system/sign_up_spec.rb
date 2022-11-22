require 'rails_helper'

RSpec.describe 'SignUps', type: :system do
  # 正常に会員登録ができること
  it 'user sign-up successfully setting 12 items' do
    user = FactoryBot.build(:user)

    visit root_path

    expect do
      click_on '新規登録'
      fill_in 'ユーザ名', with: user.name
      fill_in 'メールアドレス', with: user.email
      fill_in 'パスワード(8文字以上)', with: user.password
      fill_in 'パスワード（確認用）', with: user.password
      click_on '登録する'

      expect(page).to have_current_path authenticated_root_path
      expect(page).to have_content 'アカウント登録が完了しました。'
      expect(page).to have_content user.name
    end.to change { User.count }.by(1).and change { Item.count }.by(12)
  end

  # 確認用パスワードがなく登録失敗すること
  it 'user fails to sign-up without password_confirmation' do
    user = FactoryBot.build(:user)

    visit root_path

    expect do
      click_on '新規登録'
      fill_in 'ユーザ名', with: user.name
      fill_in 'メールアドレス', with: user.email
      fill_in 'パスワード(8文字以上)', with: user.password
      fill_in 'パスワード（確認用）', with: ''
      click_on '登録する'

      expect(page).to have_current_path '/users'
      expect(page).to have_content '新規会員登録'
      expect(page).to have_content 'パスワード（確認用）とパスワードの入力が一致しません'
    end.not_to change(User, :count)
  end
end
