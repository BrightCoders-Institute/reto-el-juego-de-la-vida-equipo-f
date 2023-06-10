# frozen_string_literal: true

# Class Cell represents a cell in a game or grid.
# It holds information about the state and position of the cell.
class Cell
  def initialize(position_rows, position_columns, state = 0)
    @state = state
    @position_rows = position_rows
    @position_columns = position_columns
    @neighbours = []
  end

  def new_state(new_state)
    @state = new_state
  end

  def obtain_state
    @state
  end

  def verify_live_n(board)
    @neighbours = []
    (-1..1).each do |i|
      (-1..1).each do |j|
        next if i.zero? && j.zero?

        neighbour_row = @position_rows + i
        neighbour_column = @position_columns + j

        if valid_neighbour?(board, neighbour_row, neighbour_column)
          neighbour_state = board[neighbour_row][neighbour_column].obtain_state
          @neighbours << neighbour_state
        end
      end
    end
  end

  def valid_neighbour?(board, row, column)
    row_valid = row >= 0 && row < board.length
    column_valid = column >= 0 && column < board[0].length
    row_valid && column_valid
  end

  def verify_state
    live_neighbours = verify_live_neighbours

    if @state == 1 && (live_neighbours.length < 2 || live_neighbours.length > 3) # muerte por soledad o sobrepoblación
      new_state(0)
    elsif @state.zero? && live_neighbours.length == 3 # nacimiento de una nueva célula
      new_state(1)
    end
  end

  def verify_live_neighbours
    @neighbours.select { |n| n == 1 }
  end
end
