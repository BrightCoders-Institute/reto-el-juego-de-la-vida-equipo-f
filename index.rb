require 'cell'
class GameOfLife
  def initialize(rows, columns)
    # we define our's variables
    @rows = rows
    @columns = columns
    @board = []
  end

  def play(generations = 1)
    i = 0;
    while i < generations
      next_generation
    end
  end

  def create_board
    @board = Array.new(@rows) { Array.new(@columns, 0) } # we create our board with rows and columns
  end

  def fill_board
    @board.each_with_index do |row, i| # we enter the board and get the element and his index
      row.each_with_index do |_, j| # same here with each row
        @board[i][j] = Cell.new(rand(0..1), i, j)
      end
    end
  end

  def print_board
    @board.each do |rows| # we print the rows with commas or spaces idk
      p rows.join(' ')
    end
  end

  def verify_neightbours()

  end

  def next_generation()
    @newboard = []
    Cell.each do |cell|
    if(cell.live && cell.live.live_neighbours < 2)
      newboard.push cell
    end
    newboard.each(&:toggle!)
  end
end

game1 = GameOfLife.new(10, 10)
game1.create_board
game1.fill_board
game1.print_board
