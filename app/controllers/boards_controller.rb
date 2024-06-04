class BoardsController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]
  def index
    @boards = Board.includes(:user).all
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
        redirect_to boards_path, notice: 'Be OPEN ですね⭐'
    else
        flash.now[:alert] = '投稿に失敗しました'
        render :new, status: :unprocessable_entity
    end
  end

  private

  def board_params
    params.require(:board).permit(:title, :body, :board_image, :board_image_cache)
  end
end
