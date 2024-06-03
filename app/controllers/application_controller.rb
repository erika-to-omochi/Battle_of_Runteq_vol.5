class ApplicationController < ActionController::Base
  before_action :require_login
  helper_method :logged_in?, :current_user

  private

  def require_login
    return if logged_in?

    not_authenticated
  end

  def not_authenticated
    redirect_to login_path, alert: "ログインしてください"
  end
end