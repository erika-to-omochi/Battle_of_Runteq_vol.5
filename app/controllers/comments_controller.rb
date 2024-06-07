class CommentsController < ApplicationController
  def create
    comment = current_user.comments.build(comment_params)
    if comment.save
      redirect_to board_path(comment.board_id), notice: 'コメントしました'
    else
      redirect_to board_path(comment.board_id), notice: 'コメントできませんでした'
    end
  end

  def edit
  end

  def destroy
  end

  def index
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(board_id: params[:board_id])
  end
end
