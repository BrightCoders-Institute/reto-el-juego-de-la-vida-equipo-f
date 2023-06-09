# frozen_string_literal: true
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

  def verify_neighbours(board)
    @neighbours = []
    (-1..1).each do |i|
      (-1..1).each do |j|
        next if i == 0 && j == 0

        neighbour_row = @position_rows + i
        neighbour_column = @position_columns + j

        if neighbour_row >= 0 && neighbour_row < board.length && neighbour_column >= 0 && neighbour_column < board[0].length
          neighbour_state = board[neighbour_row][neighbour_column].obtain_state
          @neighbours << neighbour_state
        end
      end
    end
  end

  def verify_state
    live_neighbours = verify_live_neighbours

    if @state == 1 && (live_neighbours.length < 2 || live_neighbours.length > 3) # muerte por soledad o sobrepoblación
      new_state(0)
    elsif @state == 0 && live_neighbours.length == 3 # nacimiento de una nueva célula
      new_state(1)
    end
  end

  def verify_live_neighbours
    @neighbours.select { |n| n == 1 }
  end
end
