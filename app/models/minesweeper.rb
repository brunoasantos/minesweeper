class Minesweeper
  attr_accessor :board

  def initialize(board_params = {})
    @board = Board.new(board_params)
  end
end
