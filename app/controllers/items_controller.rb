class ItemsController < ApplicationController
  before_action :set_item, only: %i[edit update]
  before_action :item_owner?, only: %i[edit update]

  # 項目一覧画面
  def index
    @items = current_user.items.get_fixed_order
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
