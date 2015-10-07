class Player
  include View
  attr_reader :name, :marker
  def initialize(args={})
    @marker = args[:marker] || 'X'
    @name = args[:name] || "Player"
  end

  def move(board)
    display("It's your turn, #{name}. Please pick from the possible moves")
    display(board.possibl_moves)
    move = get_move
    until board.validate_move(move)
      display("that choice was invalid, please pick a valid choice from the list of possible moves:")
      display(board.possibl_moves)
      move = get_move
    end
    board.move(marker, move)
  end





end