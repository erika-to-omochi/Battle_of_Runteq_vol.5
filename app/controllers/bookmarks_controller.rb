class BookmarksController < ApplicationController
  before_action :require_login

  def create
    @board = Board.find(params[:board_id])
    @bookmark = current_user.bookmarks.create(board: @board)
    respond_to do |format|
      format.turbo_stream
    end
  end

  def destroy
    @bookmark = current_user.bookmarks.find(params[:id])
    @board = @bookmark.board
    @bookmark.destroy
    respond_to do |format|
      format.turbo_stream
    end
  end
end
