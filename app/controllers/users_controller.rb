class UsersController < ApplicationController
  before_action :get_items_includes_logs, only: %i[show]

  # 仮で実装しました。
  def index
    @users = User.all
  end

  def show
    @feed_logs = current_user.logs.order_desc.page(params[:page])
    @log = current_user.logs.build
    
  end


  private
  
  def get_items_includes_logs
    @items = current_user.items.includes(:logs)
  end

end