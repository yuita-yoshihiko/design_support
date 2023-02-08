class ApplicationController < ActionController::Base
  add_flash_types :success, :error
  before_action :require_login

  def not_authenticated
    flash[:error] = t('defaults.message.require_login')
    redirect_to login_path
  end
end
