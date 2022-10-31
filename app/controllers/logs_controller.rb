class LogsController < ApplicationController
  before_action :log_owner?, only: %i[destroy]

  def create
    @log = current_user.logs.build(log_params)
    if @log.save
      redirect_to authenticated_root_path, notice: '記録を保存しました。'
    else
      @user = current_user
      @feed_logs = @user.logs.page(params[:page])
      flash.now[:alert] = '1回の記録は0 ~ 180分にしてください'
      render 'users/show', status: :unprocessable_entity
    end
  end

  # def edit
  # end

  # def update
  # end

  def destroy
    @log = current_user.logs.find(params[:id])
    @log.destroy
    redirect_to authenticated_root_path, notice: '記録を削除しました。'
  end

  private

  def log_params
    params.require(:log).permit(:amount, :item_id)
  end

  def log_owner?
    unless current_user == Log.find(params[:id]).user
      redirect_to root_path, alert: '権限の内容操作です。'
    end

  end


end
