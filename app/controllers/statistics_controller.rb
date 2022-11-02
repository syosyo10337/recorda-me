class StatisticsController < ApplicationController
 
  def index
    @items = current_user.items.includes(:logs)
    @user = current_user
    @logs = current_user.logs
  end
end
