module Api
  class ItemsController < ApplicationController
    def index
      render json: current_user.items.get_fixed_order
    end

    def update
      item = Item.find(params[:id])
      item.update(items_params)
      head :ok
    end

    private

    def items_params
      params.require(:item).permit(:name)
    end
  end
end
