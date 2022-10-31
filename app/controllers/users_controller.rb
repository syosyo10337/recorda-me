class UsersController < ApplicationController

  # 仮で実装しました。
  def index
    @users = User.all
  end

  def show
    @user = current_user
    @feed_logs = @user.logs.page(params[:page])

    @log = @user.logs.build
  end
end
