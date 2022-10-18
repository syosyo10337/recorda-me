module LoginSupport
  def login_as(user)
    visit root_path
    #ログイんページへ
    find('.btn.btn-outline-secondary').click

    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    within 'form' do
      click_on "ログイン"
    end
  end
end

