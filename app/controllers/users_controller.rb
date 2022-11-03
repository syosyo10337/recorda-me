class UsersController < ApplicationController

  # 仮で実装しました。
  def index
    @users = User.all
  end
  
  def home
    # @feed_logsにセット
    set_feed_logs
    # @itemsにセット
    set_items_includes_logs
    @feed_logs = current_user.logs.order_desc.includes(:item).page(params[:page])
    @log = current_user.logs.build
  end
end