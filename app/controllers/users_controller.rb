class UsersController < ApplicationController

  # 仮で実装しました。
  def index
    @users = User.all
  end

  def show
    @user = current_user
    @logs = @user.logs.order(created_at: :desc).page(params[:page])
  end
end
