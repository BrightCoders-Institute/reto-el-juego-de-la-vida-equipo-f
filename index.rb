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
    generations.times do |i|
      @board = next_generation(@board)
      puts("")
      puts ("New Board")
      print_board(@board)

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
    puts ("Old Board")
    @board = fill_board(create_board)
    print_board(@board)
  end

  def next_generation(old_board)
    new_board = create_board
    old_board.each_with_index do |rows, i|
      rows.each_with_index do |cell, j|
        new_cell = cell.dup
        new_cell.verify_neighbours(old_board)
        new_cell.verify_state
        new_board[i][j] = new_cell
      end
    end
    new_board
  end
end

game1 = GameOfLife.new(10, 10)
game1.play(1)
