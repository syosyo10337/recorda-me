class StatisticsController < ApplicationController

  #グラフの出し分けだけなら、まとめられそう。
  def pie
    @items = current_user.items.includes(:logs)
    @user = current_user
    @logs = current_user.logs
  end

  def line
    @items = current_user.items.includes(:logs)
    @user = current_user
    @logs = current_user.logs

  end

end
