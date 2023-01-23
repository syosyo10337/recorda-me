module Api
  class ChartsController < ApplicationController
    before_action :set_items_includes_logs, only: %i[all_pies all_lines]
    def all_lines
      render json: @items.map { |item|
        { name: item.name,
          data: item.logs.group_by_month('logs.created_at', last: 3, format: '%m月').sum('logs.amount / 60') }
      }
    end

    def all_pies
      render json: @items.map { |item|
        [item.name, item.logs.sum('amount / 60')]
      }
    end
  end
end