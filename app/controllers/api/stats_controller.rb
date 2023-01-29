module Api
  class StatsController < ApplicationController
    before_action :set_items_includes_logs, only: %i[all_pies all_lines accumulate_amounts]
    # FIXME: jsonデータを整形する。フロントで処理がすくなくなるように
    def all_lines
      render json: {
        content: @items.map do |item|
          {
            name: item.name,
            data: item.logs.group_by_month('logs.created_at', last: 3, format: '%m').sum('logs.amount / 60')
          }
        end,
        timeline: recent_3_months
      }
    end

    def all_pies
      render json: @items.map { |item|
        [item.name, item.logs.sum('amount / 60')]
      }
    end

    def accumulate_amounts
      render json: {
        total: @items.sum('logs.amount / 60'),
        monthly: @items.where('logs.created_at > ?', Time.zone.now.beginning_of_month).sum('amount / 60'),
        weekly: @items.where('logs.created_at > ?', Time.zone.now.beginning_of_week).sum('amount / 60')
      }
    end

    private

    def recent_3_months
      today = Time.zone.today
      [
        "#{today.prev_month(2).month}月",
        "#{today.prev_month.month}月",
        "#{today.month}月"
      ]
    end
  end
end
