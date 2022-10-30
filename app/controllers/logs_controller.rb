class LogsController < ApplicationController
  def create
    @log = current_user.logs.build(log_params)
    if @log.save
      redirect_to authenticated_root_path, notice: '記録を保存しました。'
    else
      @user = current_user
      @feed_logs = @user.logs.page(params[:page])
      flash[:alert] = '1回の記録は0 ~ 180分にしてください'
      render 'users/show', status: :unprocessable_entity
    end
  end

  # def edit
  # end

  # def update
  # end

  def destroy
  end

  private

  def log_params
    params.require(:log).permit(:amount, :item_id)
  end
end
