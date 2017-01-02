class Board
  attr_accessor :rows, :columns, :mines, :cells

  def initialize(params = {})
    params = {
      'rows' =>    10,
      'columns' => 10,
      'mines' =>   5,
      'cells' => false
    }.merge(params)

    @rows    = params['rows']
    @columns = params['columns']
    @mines   = params['mines']
    @cells   = params['cells'] || build_initial_board
    @lost    = false
  end

  def lost?
    !!@lost
  end

  def reveal(x, y)
    if mine?(x, y)
      @lost = true
      return :mine
    end

    reveal_tile(x, y)
    reveal_adjacent_tiles(x, y)
    
    cells[x][y]
  end

  private

  def reveal_tile(x, y)
    return if mine?(x, y)
    cells[x][y] = calculate_adjacent_mines(x, y)
  end

  def reveal_adjacent_tiles(x, y)
    adjacent_tiles(x, y).each do |tile|
      reveal_tile(tile[:x], tile[:y])
    end
  end

  def build_initial_board
    @cells = Array.new(rows) { Array.new(columns) }
    place_mines

    @cells
  end

  def place_mines
    mines.times do |i|
      cells[rand(rows - 1)][rand(columns - 1)] = 'mine'
    end
  end

  def mine?(x, y)
    cells[x][y] == 'mine'
  end

  def revealed?(x, y)
    !cells[x][y].nil?
  end

  def calculate_adjacent_mines(x, y)
    adjacent_tiles(x, y).reduce(0) do |count, tile|
      cells[tile[:x]][tile[:y]] == 'mine' ? count + 1 : count
    end
  end

  def adjacent_tiles(x, y)
    adjacent_tiles = []
    [-1, 0, 1].each do |i|
      [-1, 0, 1].each do |j|
        adj_x = x + i
        adj_y = y + j
        next if adj_x == x && adj_y == y
        next if adj_x < 0 || adj_y < 0
        next if adj_x >= rows || adj_y >= columns

        adjacent_tiles << {x: adj_x, y: adj_y}
      end
    end

    adjacent_tiles
  end
end
