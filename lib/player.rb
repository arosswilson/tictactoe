class Player
  include View
  attr_accessor :name, :marker
  def initialize(args={})
    @marker = args[:marker] || 'X'
    @name = args[:name] || "Player"
  end

  def get_name
    @name = disp_and_res("What's your name?")
  end

  def get_marker
    @marker = disp_and_res("What would you like your marker to be (ie 'X')?")
    until @marker.length == 1
      @marker = disp_and_res("What would you like your marker to be (ie 'X')? It can only be one character long")
    end
  end

  def move(board)
    display("It's your turn, #{name}. Please pick from the possible moves The first choice is the row, the second is the column")
    move = disp_and_res(board.possible_moves)
    until board.validate_move(move)
      display("that choice was invalid, please pick a valid choice from the list of possible moves:")
      move = disp_and_res(board.possible_moves)
    end
    board.move(marker, move)
  end
end