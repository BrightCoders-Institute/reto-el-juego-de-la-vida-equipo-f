# frozen_string_literal: true
class Cell
  def initialize(position_rows, position_columns, state = 0)
    @state = state
    @position_rows = position_rows
    @position_columns = position_columns
    @neighbours = []
  end

  def new_state(newstate)
    @state = newstate;
  end

  def obtain_state
    @state
  end
  #recibimos la copia
  def verify_neighbours(board)

    # (0,0) (0,1) (0,2)
    # (1,0) (1,1) (1,2)
    # (2,0) (2,1) (2,2)
    (board[@position_rows - 1][@position_columns - 1]) # 0 0
    (board[@position_rows - 1][@position_columns]) # 0 1
    (board[@position_rows - 1][@position_columns + 1]) # 0 2
    (board[@position_rows][@position_columns - 1]) # 1 0
    (board[@position_rows][@position_columns + 1]) # 1 2
    (board[@position_rows + 1][@position_columns - 1]) # 2 0
    (board[@position_rows + 1][@position_columns]) # 2 1
    (board[@position_rows + 1][@position_columns + 1]) # 2 2
  end

  #Cell Rules Test
  def verify_state
    live_neighbours = verify_live_neighbours
    if(@state==1 && live_neighbours.length() < 2 || @state == 1 && live_neighbours.length() > 3) # kill cell
      new_state(0)#add parameter
    end
    if(@state==0 && live_neighbours.length() == 3)# born a cell
      new_state(1)
    end

  end
  #We define a method to verifposition_columns the lives of neighboring cells
  def verify_live_neighbours
    @neighbours.select do |n|
      n.obtain_state == 1
    end
  end
end
