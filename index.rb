# frozen_string_literal: true
require './cell'
class GameOfLife
  def initialize(rows, columns)
    # we define our's variables
    @rows = rows
    @columns = columns
    @board = []
    init_board
  end

  def play(generations = 1)
    i = 0;
    while i < generations
      @board = next_generation(@board)
      print_board(@board)
      i += 1
    end
  end

  def create_board
    Array.new(@rows) { Array.new(@columns, 0) } # we create our board with rows and columns
  end

  def fill_board(board)
    board.each_with_index do |row, i| # we enter the board and get the element and his index
      row.each_with_index do |_, j| # same here with each row
        board[i][j] = Cell.new(i, j, rand(0..1))
      end
    end
    board
  end

  def print_board(board)
    board.each do |rows| # we print the rows with commas or spaces idk
      msg_row = []
      rows.each do |cell|
        msg_row.push(cell.obtain_state)
      end
      p msg_row.join(' ')
    end
  end

  def init_board
    @board = fill_board(create_board)
    print_board(@board)
  end

  def next_generation(old_board)
    newboard = create_board
    copy_board = old_board.clone
    old_board.each_with_index do |rows, i|
      rows.each_with_index do |cell, j|
        #por cada celula, le mandamos una copia y verificamos su estado
        cell.verify_neighbours(copy_board)
        newboard[i][j] = cell
      end
    end
    newboard
  end
end

game1 = GameOfLife.new(3, 3)
game1.play(1)


# 1 2 3
# 4 5 6
# 7 8 9

# 0 0 0       # 0 0 0       # 0 0 0
# 0 1 2    1  # 1 2 3    2  # 2 3 0   3
# 4 5 6       # 4 5 6       # 5 6 0

# 0 1 2       # 1 2 3       # 2 3 0
# 0 4 5    4  # 4 5 6   5   # 5 6 0   6
# 0 7 8       # 7 8 9       # 8 9 0

# 0 4 5       # 4 5 6       # 5 6 0
# 0 7 8    7  # 7 8 9   8   # 8 9 0   9
# 0 0 0       # 0 0 0       # 0 0 0
