module Api
  class ItemsController < ApplicationController

    def index
      render json: current_user.items.get_fixed_order
    end
  end
end
