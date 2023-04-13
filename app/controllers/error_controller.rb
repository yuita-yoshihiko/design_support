class ErrorController < ApplicationController
  skip_before_action :require_login

  def not_found
  end

  def internal_server_error
  end
end
