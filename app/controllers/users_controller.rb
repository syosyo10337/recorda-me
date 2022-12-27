class UsersController < ApplicationController
  before_action :set_feed_logs, only: %i[home]
  before_action :set_items_includes_logs, only: %i[home]
  skip_before_action :authenticate_user!, only: %i[guest]

  def home
    @log = current_user.logs.build
  end

  def guest
    user = User.find(1)
    sign_in user
    redirect_to authenticated_root_path, notice: 'ゲストとしてログインしました。'
  end
end
