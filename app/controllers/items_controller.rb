class ItemsController < ApplicationController
  ###

  # @itemに代入
  before_action :set_item, only: %i[show edit update]
  before_action :item_owner?, only: %i[show edit update]
  before_action :set_feed_logs, only: %i[show]
  # @itemsに代入
  before_action :set_items_includes_logs, only: %i[show]


  # 項目一覧画面
  def index
    @items = current_user.items.get_fixed_order
  end

  # 項目にまつわる記録を表示
  def show
    @feed_logs = @feed_logs.where(item_id: @item.id)
    # log_formのため
    @log = current_user.logs.build
  end

  # 項目名編集画面
  def edit
  end

  # 項目名を更新する
  def update
    if @item.update(items_params)
      redirect_to items_path, notice: '名前を更新しました。'
    else
      # 更新失敗時に、DB上の名前を取得する
      @item.reload
      render :edit, status: :unprocessable_entity
    end
  end

  private

  # strongparameters/name属性のみ許可
  def items_params
    params.require(:item).permit(:name)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_owner?
    unless @item.user == current_user
      redirect_to root_path, alert: '権限のない操作です。'
    end
  end
end
