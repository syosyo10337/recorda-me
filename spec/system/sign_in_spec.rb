require 'rails_helper'

RSpec.describe "SignIns", type: :system do
  include LoginSupport
  before do
    @user = FactoryBot.create(:user)
  end
  #正常にログインし、ログアウトまでできること
  scenario "user log-in and log-out successfully" do
    login_as @user
    
    expect(page).to have_content "ログインしました。"
    expect(page).to have_current_path authenticated_root_path
    #xxさんのページが表示されていること
    expect(page).to have_content @user.name

    click_on "ログアウト"

    expect(page).to have_current_path root_path
    expect(page).to have_content "ログアウトしました。"
    
  end

  #ログインに失敗し、"フラッシュ"が出ること。
  scenario "user fails to log-in with 'flash' messages" do
    visit root_path
    #ログイんページへ
    find('.btn.btn-outline-secondary').click

    fill_in "メールアドレス", with: 'mistake@example.com'
    fill_in "パスワード", with: @user.password
    within 'form' do
      click_on "ログイン"
    end
    
    expect(page).to have_content "メールアドレスまたはパスワードが違います。"
    expect(page).to have_current_path new_user_session_path
    
    visit root_path

    expect(page).to_not have_content "メールアドレスまたはパスワードが違います。"
  end


  #ログイン前後でヘッダーの表示がわかること
  scenario "To change header by logged-in" do
    login_as @user

    expect(page).to have_content "設定"
    expect(page).to have_content "ログアウト"

    click_on "ログアウト"

    expect(page).to have_content "ログイン"

  end


  #Remember_meが有効になること
  scenario "Remember_me works successfully" do
    visit root_path
    #ログイんページへ
    find('.btn.btn-outline-secondary').click

    fill_in "メールアドレス", with: @user.email
    fill_in "パスワード", with: @user.password
    check "ログインしたままにする"
    within 'form' do
      click_on "ログイン"
    end

    expect(page).to have_content "ログインしました。"
    expect(get_me_the_cookie('remember_user_token')).to_not eq nil
  end
    



end
