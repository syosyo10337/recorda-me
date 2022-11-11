class UsersController < ApplicationController
  before_action :set_feed_logs, only: %i[home]
  before_action :set_items_includes_logs, only: %i[home]

  def home
    @log = current_user.logs.build
  end
end