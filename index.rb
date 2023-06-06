class GameOfLife
  def initialize(rows, columns)
    # we define our's variables
    @rows = rows
    @columns = columns
    @board = []
    @neighbours = []
  end

  def create_board
    @board = Array.new(@rows) { Array.new(@columns, 0) } # we create our board with rows and columns
  end

  def fill_board
    @board.each_with_index do |row, i| # we enter the board and get the element and his index
      row.each_with_index do |_, j| # same here with each row
        @board[i][j] = rand(0..1)
      end
    end
  end

  def print_board
    @board.each do |rows| # we print the rows with commas or spaces idk
      p rows.join(' ')
    end
  end
end
game1 = GameOfLife.new(10, 10)
game1.createBoard
game1.fillBoard
game1.printBoard
