class BoardsController < ApplicationController
  skip_before_action :require_login
  def index
    @boards = Board.includes(:user)
  end
end
