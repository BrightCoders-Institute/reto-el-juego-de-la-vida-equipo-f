
class GameOfLife
    def initialize(rows, columns)
        #we define our's variables
        @rows = rows
        @columns = columns
        @board = []
        @neighbours = []
    end

    def createBoard()
        @board = Array.new(@rows){Array.new(@columns,0)}#we create our board based on rows and columns and we make them all 0
    end
    def fillBoard()
        @board.each_with_index do |row, i|#we enter the board and get the element and his index
            row.each_with_index do |_, j|#same here with each row
                @board[i][j] = rand(0..1) 
            end
        end
    end
    def printBoard()
        @board.each do |rows|  #we print the rows with commas or spaces idk
            p rows.join(' ')
        end
    end
    def createneighbours()

    end
end
game1 = GameOfLife.new(10,10)
game1.createBoard
game1.fillBoard
game1.printBoard