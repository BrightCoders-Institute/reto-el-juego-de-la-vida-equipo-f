class Cell {
  def initialize(state = 0, position_rows, position_columns,wordl,x,y)
    @world, @x, @y = world, x, y
    @live = false
    @state = state
    @position_rows = position_rows
    @position_columns = position_columns
  end

  def dead?
    !@live
  end

  def dead!
    @live = false
  end

  def live?
    @live
  end

  def live!
    @live = true
  end

  def toggle!
    @live = !@live
  end

 #def kill
  #  @state = 0
  #  @kill = false
  #end

 #def live
 #  @state = 1
 #  @live = true
 #end

  def neighbours
    neighbours = []
    neighbours.push(@world.cell_at(self.x - 1, self.y - 1))
    neighbours.push(@world.cell_at(self.x - 1, self.y))
    neighbours.push(@world.cell_at(self.x - 1, self.y + 1))
    neighbours.push(@world.cell_at(self.x, self.y - 1))
    neighbours.push(@world.cell_at(self.x, self.y + 1))
    neighbours.push(@world.cell_at(self.x + 1, self.y - 1))
    neighbours.push(@world.cell_at(self.x + 1, self.y))
    neighbours.push(@world.cell_at(self.x + 1, self.y + 1))
    neighbours
  end

  #We define a method to verify the lives of neighboring cells
  def live_neighbours
    self.neighbours.select do |n|
        n && n.live
    end
  end
}
