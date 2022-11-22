class StatisticsController < ApplicationController
  before_action :set_items_includes_logs, only: %i[pie line]
  # Ajax出来そう。
  def pie; end

  def line; end
end
