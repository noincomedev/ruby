=begin
1- init game
2- show rules
3- start game ? play first ound : close game
4- unless check winner and not draw ? next round : set winner
5- ask play again ? start game : close game
=end

class Board
  attr_accessor :playing
  attr_accessor :plays
  def initialize(width, height)
    @grid = Array.new [width, height]
    @playing = true
    @plays = {}
    puts "============="
    puts "Game starting"
    puts "============="
    puts "==X STARTS=="
    puts "============="
    puts "Game finished"
    puts "============="
  end

  def play
    puts "Choose a empty square"
    option = gets.chomp.to_i
    # check if square is empty
    puts @plays[option]== nil ?      @plays[option] = @plays.length == 0 ||  (@plays.length + 1)%2 != 0 ? "X":"O"
     :   "Casilla Ocupada escoge otra"
@plays[option]=="X" ? player=1 : player=2

    puts "Player #{player} on square #{option}"
   # puts @plays
  end
end


class TicTacToe
  attr_accessor :play
  def initialize
    showRules
    @play = true
  end

  def start
    puts "New Game? 1:START 0:EXIT"
    @input = gets.chomp.to_i
    case @input
    when 1
      @board = Board.new(3,3)
      while @board.playing
        @board.play
      end
    else
      @play = false
    end
  end

  def showRules
    puts "======================================="
    puts "======== Welcome to TicTacToe! ========"
    puts "======================================="
    puts "The rules are simple. Two players take"
    puts "turns placing a mark on a 3x3 grid. Which"
    puts "ever gets three marks lined up first wins!"
    puts "If there are no more room to place marks"
    puts "then it's a draw! The grids are numbered"
    puts "1-9 from top to bottom."
    puts "Good luck, and have fun! :)"
  end
end

game = TicTacToe.new

while game.play do
  game.start
end