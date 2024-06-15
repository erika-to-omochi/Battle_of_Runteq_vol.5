class BoardsController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create, :show]
  before_action :set_board, only: %i[edit update destroy]

  def index
    @boards = Board.all.includes([:user, :bookmarks]).order(created_at: :desc)
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

  def bookmarks
    @bookmark_board = current_user.bookmark_boards.includes(:user).order(created_at: :desc)
  end

  private

  def set_board
    @board = current_user.boards.find(params[:id])
  end

  def render_not_found
    render file: Rails.public_path.join('404.html'), status: :not_found
  end

  def board_params
    params.require(:board).permit(:title, :body, :board_image, :board_image_cache, :discription)
  end
end
