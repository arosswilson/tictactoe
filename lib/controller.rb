require_relative 'view'
require_relative 'player'
require_relative 'board'
require_relative 'computer'
require 'pry'
class Controller
  include View
  attr_reader :player, :computer, :board
  attr_accessor :keep_playing
  def initialize(args={})
    @player = args[:player]
    @computer = args[:computer]
    @board = args[:board]
    @keep_playing = true
  end

  def run
    init
    while keep_playing
      new_board?
      game_loop(board, player, computer)
      final_board(board)
      display(@board.find_winner(player, computer))
      play_again?
    end
  end

  private

  def init
    clear
    welcome
    player.get_name
    player.get_marker
    computer.update_op_mrkr(player.marker)
    computer.update_mrkr
  end

  def final_board(board)
    clear
    show_board(board)
  end

  def move(board, player)
    clear
    show_board(board)
    player.move(board)
  end

  def game_loop(board, player, computer)
    until board.game_over?
      move(board, player)
      break if board.game_over?
      move(board, computer)
    end
  end

  def play_again?
    res = disp_and_res("want to play again? Please enter 'Y' or 'N'").downcase
    until res == "y" || res == "n"
      res = disp_and_res("invalid response, please enter 'Y' or 'N'.").downcase
    end
    @keep_playing = false if res == 'n'
  end

  def new_board?
    if board.game_over?
      @board = Board.newboard(board)
    end
  end
end

controller = Controller.new({player: Player.new, board: Board.new({board_size: 3}), computer: Computer.new})
controller.run