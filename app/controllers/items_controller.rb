class ItemsController < ApplicationController
  #項目一覧画面
  def index
    @items = current_user.items
  end

  #項目名編集画面
  def edit
    @item = current_user.items.find(params[:id])
  end

  #項目名を更新する
  def update
  end

  

end
