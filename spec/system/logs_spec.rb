require 'rails_helper'

RSpec.describe 'Logs', js: true, type: :system do
  include LoginSupport

  let!(:user) { FactoryBot.create(:user) }
  let!(:item) { FactoryBot.create(:named_item, user: user) }

  # ユーザが記録をすること。
  describe 'user creates a log' do
    context 'when user is logged in' do
      # ユーザが記録に成功すること
      it 'user creates a log successfully' do
        login_as user

        expect do
          fill_in 'log_amount', with: '45'
          select 'テスト用の項目', from: 'log_item_id'
          click_on '記録する'

          expect(page).to have_content '記録を保存しました。'
          expect(page).to have_css 'ul li', text: 'テスト用の項目'
          expect(page).to have_css 'ul li', text: '45 min'
        end.to change { Log.count }.by(1)
      end

      # 値を入力せずに、記録し失敗すること
      it 'user fails to make log without amount' do
        login_as user

        expect do
          fill_in 'log_amount', with: ' '
          expect(page).to have_select(
            'log_item_id', options: user.items.pluck(:name)
          )
          select 'テスト用の項目', from: 'log_item_id'
          click_on '記録する'

          expect(page).to have_content '1回の記録は0 ~ 180分にしてください'
          expect(page).not_to have_css 'ul li', text: 'テスト用の項目'
          expect(page).not_to have_css 'ul li', text: '45 min'
        end.not_to change(user.logs, :count)
      end
    end

    # logフォームのあるauthenticated_rootにアクセスできないこと
    context 'when user is not logged in' do
      it "user can't get log-form" do
        visit authenticated_root_path
        expect(page).to have_content '自分自身を記録しよう'
      end
    end
  end

  describe 'user delete log' do
    it 'log is deleted successfully' do
      login_as user
      fill_in 'log_amount', with: '45'
      select 'テスト用の項目', from: 'log_item_id'
      click_on '記録する'

      expect do
        log_id = user.logs.first.id
        click_on "delete-log-#{log_id}"
        page.accept_confirm

        expect(page).to have_content '記録を削除しました。'
      end.to change { Log.count }.by(-1)
    end
  end
end
