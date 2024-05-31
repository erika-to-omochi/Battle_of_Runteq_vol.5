class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      logger.info "User #{@user.email} logged in successfully."
      redirect_to root_path, notice: 'ログインに成功しました'
    else
      logger.warn "Login failed for email: #{params[:email]}"
      logger.debug "User login failed with email: #{params[:email]} and password: #{params[:password]}"
      flash.now[:alert] = 'メールアドレスまたはパスワードが無効です'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, status: :see_other
  end
end
