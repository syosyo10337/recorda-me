class ItemsController < ApplicationController
  before_action :set_feed_logs, only: %i[show]
  # @itemsに代入
  before_action :set_items_includes_logs, only: %i[show]

  def index; end

  def show
    set_item
    item_owner?
    @feed_logs = @feed_logs.where(item_id: @item.id)
    # log_formのため
    @log = current_user.logs.build
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_owner?
    return if @item.user == current_user
    redirect_to root_path, alert: '権限のない操作です。'
  end
end
