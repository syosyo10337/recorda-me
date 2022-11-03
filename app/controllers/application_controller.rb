class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  # sign-up時にname属性の値を許可した。
  # account_editにもname属性を許可した。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  private

  def set_items_includes_logs
    @items = current_user.items.get_fixed_order.includes(:logs)
  end

  def set_feed_logs
    @feed_logs = current_user.logs.order_desc.includes(:item).page(params[:page])
  end
end
