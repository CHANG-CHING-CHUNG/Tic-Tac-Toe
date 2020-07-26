class TicTacToe
  attr_accessor :gameBoard,:player1,:player2, :turn, :end
  def initialize
    @gameBoard = [
      [[],[],[]],
      [[],[],[]],
      [[],[],[]]
    ]
    @end = false
    @turn = 0;
  end

  
  def startGame
    y = 0;
    x = 0;
    self.initPlayers
    turn = self.turn
    if self.turn === 0
      puts "Player1's turn"
      self.turn = 1
    else 
      puts "Player2's turn"
      self.turn = 0
    end
    loop do
      puts "Enter row 0~2."
      y = gets.to_i
      puts "Enter column 0~2."
      x = gets.to_i
      isMark = checkMark(self.gameBoard[y][x])
      break if (y >= 0 && y <= 2) && (x >= 0 && x <= 2) && !isMark
    end
    self.putMark(y,x,turn)
    if self.checkWin(self.gameBoard,self.gameBoard[y][x])
      self.end = true
    end
    if self.end === false
      self.startGame
    else 
      puts 'Game over'
      puts 'Would you like to play again? Y/N'
      isAgain = gets.chomp.downcase 
      if isAgain === 'y'
        self.gameBoard = [
                          [[],[],[]],
                          [[],[],[]],
                          [[],[],[]]
                          ]
        self.end = false
        self.turn = 0
        self.startGame()
      elsif isAgain === 'n'
        puts 'Good Bye!'
        return
      end
    end
  end
  
  protected
  def putMark(y, x, turn)
    player1 = self.player1
    player2 = self.player2

    if turn === 0
      self.gameBoard[y][x] = player1
    else 
      self.gameBoard[y][x] = player2
    end

    self.gameBoard.each do |line|
      p line
    end
  end

  def checkMark(board)
    if board.is_a? String
      puts 'Here is a mark already, please choose other cells.'
    end
    return board.is_a? String
  end
  
  def checkWin(board,playerMark)
    mark = playerMark
    win = false
    board.each do |row|
      if (row[0] === mark) && (row[1] === mark) && (row[2] === mark)
        win = checkWinHelper(mark)
      end
    end
    if (board[0][0] === mark) && (board[1][0] === mark) && (board[2][0] === mark)
      win = checkWinHelper(mark)
    elsif (board[0][1] === mark) && (board[1][1] === mark) && (board[2][1] === mark)
      win = checkWinHelper(mark)
    elsif (board[0][2] === mark) && (board[1][2] === mark) && (board[2][2] === mark)
     win = checkWinHelper(mark)
    elsif (board[0][0] === mark) && (board[1][1] === mark) && (board[2][2] === mark)
     win = checkWinHelper(mark)
    elsif (board[0][2] === mark) && (board[1][1] === mark) && (board[2][0] === mark)
     win = checkWinHelper(mark)
    end

    return win
  end

  def checkWinHelper(boardMark)
    mark = boardMark
    if mark === 'O'
      puts 'Winner is Player1!'
    else 
      puts 'Winner is Player2!'
    end
    return true
  end

  def initPlayers
    @player1 = 'O'
    @player2 = 'X'
  end

end

game = TicTacToe.new
game.startGame