# frozen_string_literal: true

require_relative './cell'
require_relative './index'

describe Cell do
  it 'initializes with the correct state and position' do
    cell = Cell.new(0, 0, 1)
    expect(cell.obtain_state).to eq(1)
    expect(cell.instance_variable_get(:@position_rows)).to eq(0)
    expect(cell.instance_variable_get(:@position_columns)).to eq(0)
  end
end

describe Cell do
  it 'changes state correctly' do
    cell = Cell.new(0, 0)
    expect(cell.obtain_state).to eq(0)
    cell.new_state(1)
    expect(cell.obtain_state).to eq(1)
  end
end

describe Cell do
  it 'verifies live neighbours correctly' do
    board = [[Cell.new(0, 0, 1), Cell.new(0, 1, 0), Cell.new(0, 2, 1)],
             [Cell.new(1, 0, 0), Cell.new(1, 1, 1), Cell.new(1, 2, 0)],
             [Cell.new(2, 0, 1), Cell.new(2, 1, 0), Cell.new(2, 2, 1)]]

    cell = board[1][1]
    cell.verify_live_n(board)
    expect(cell.verify_live_neighbours).to eq([1, 1, 1, 1])
  end
end
