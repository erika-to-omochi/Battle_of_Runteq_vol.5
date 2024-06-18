class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    logger.debug "Login attempt with email: #{params[:email]}"
    @user = login(params[:email], params[:password])

    if @user
      logger.debug "Login successful for user: #{@user.id}"
      redirect_to root_path, notice: 'ログインしました'
    else
      logger.debug "Login failed for email: #{params[:email]}"
      flash.now[:alert] = 'ログインに失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'ログアウトしました', status: :see_other
  end
end
