class StatisticsController < ApplicationController
  before_action :set_items_includes_logs, only: %i[pie line]
  # 将来的には、チャートだけの切り替えにすること。つまり JSでの実装
  def pie; end

  def line; end
end
