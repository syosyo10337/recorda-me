class StatisticsController < ApplicationController
  before_action :set_items_includes_logs, only: %i[index]

  def index; end
end
