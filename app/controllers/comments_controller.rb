class CommentsController < ApplicationController
  def create
    @board = Board.find(params[:board_id])
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      @comments = @board.comments
      respond_to do |format|
        format.html { redirect_to @board, notice: 'コメントが追加されました。' }
        format.turbo_stream
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.turbo_stream
      end
    end
  end

  def edit
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to board_path(@comment.board), notice: 'コメントが削除されました。' }
    end
  end

  def index
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(board_id: params[:board_id])
  end
end
