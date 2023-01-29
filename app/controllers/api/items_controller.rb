module Api
  class ItemsController < ApplicationController
    def index
      render json: current_user.items.get_fixed_order
    end

    def update
      item = Item.find(params[:id])
      if item.update(items_params)
        render json: '名前を更新しました。', status: :ok
      else
        render json: item.errors.full_messages, status: :unprocessable_entity
      end
    end

    private

    def items_params
      params.require(:item).permit(:name)
    end
  end
end
