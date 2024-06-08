class BoardsController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create, :show]
  def index
    @boards = Board.includes(:user).all.order(created_at: :desc)

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

  def show
    @board = Board.find(params[:id])
    @comment = Comment.new
    @comments = @board.comments.includes(:user).order(created_at: :desc)
    @comment_count = @board.comments.count
  end

  def edit
    @board = current_user.boards.find(params[:id])
  end

  def update
    @board = current_user.boards.find(params[:id])
    if @board.update(board_params)
      redirect_to boards_path, notice: '更新しました⭐'
    else
      flash.now[:alert] = '更新に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @board = current_user.boards.find(params[:id])
    @board.destroy!
    redirect_to boards_path, notice: '削除しました⭐'
  end

  private

  def board_params
    params.require(:board).permit(:title, :body, :board_image, :board_image_cache, :discription)
  end
end
