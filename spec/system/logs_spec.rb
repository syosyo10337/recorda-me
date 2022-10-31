require 'rails_helper'

RSpec.describe "Logs", type: :system do
  include LoginSupport

  let(:user) { FactoryBot.create(:user, :with_items) }

  # ユーザが記録をすること。
  describe 'user creates a log' do
    context 'when user is logged in' do
      # ユーザが記録に成功すること
      scenario 'user creates a log successfully' do
        login_as user

        expect {
          fill_in 'log_amount', with: '45'
          select 'テスト項目48', from: 'log_item_id'
          click_on '記録する'

          expect(page).to have_content '記録を保存しました。'
          expect(page).to have_css 'ul li', text: 'テスト項目48'
          expect(page).to have_css 'ul li', text: '45 min'
        }.to change { Log.count }.by(1)
      end

      # 値を入力せずに、記録し失敗すること
      scenario 'user fails to make log without amount' do
        login_as user

        expect {
          fill_in 'log_amount', with: " "
          expect(page).to have_select(
            'log_item_id', options: user.items.pluck(:name))
          select 'テスト項目60', from: 'log_item_id'
          click_on '記録する'

          expect(page).to have_content '1回の記録は0 ~ 180分にしてください'
          expect(page).to_not have_css 'ul li', text: 'テスト項目60'
          expect(page).to_not have_css 'ul li', text: '45 min'
        }.to_not change(user.logs, :count)
      end
    end
    # logフォームのあるauthenticated_rootにアクセスできないこと
    context 'when user is not logged in' do
      scenario "user can't get log-form" do
        visit authenticated_root_path
        expect(page).to have_content '自分自身を記録しよう'
      end
    end
  end
end
