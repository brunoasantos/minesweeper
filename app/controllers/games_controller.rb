class GamesController < ApplicationController
  def index
    @board = Board.new
    session[:board] = @board
  end

  def reveal
    @board = Board.new(session[:board])
    x, y = params[:xy].split(',')
    @board.reveal(x.to_i, y.to_i)

    render :index
  end
end
