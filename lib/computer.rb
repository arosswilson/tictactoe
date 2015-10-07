require_relative 'board.rb'
require_relative 'view'
class Computer
  include View
  attr_accessor :best_move
  attr_reader :marker, :opponent_marker
  def initialize(args={})
    @marker = args[:marker] || "O"
    @opponent_marker = args[:opponent_marker] || "X"
    @best_move
  end

  def update_op_mrkr(player_marker)
    @opponent_marker = player_marker
  end

  def update_mrkr
    @marker = disp_and_res("what would you like the computer marker to be?")
    until @marker != opponent_marker
      @marker = disp_and_res("you can't choose the same marker as your own. your marker is #{opponent_marker}")
    end
  end

  def minimax(board, computers_turn, depth = 0)
    return score(board, depth) if board.game_over?
    scores = []
    moves =[]
    board.possible_moves.each do |move|
      board.move(marker, move) if computers_turn
      board.move(opponent_marker, move) if !computers_turn
      scores << minimax(board, false, depth+1) if computers_turn
      scores << minimax(board, true, depth+1) if !computers_turn
      moves << move
      board.undo(move)
    end
    best_move(scores, moves, computers_turn)
  end

  def move(board)
    minimax(board,true,)
    board.move(marker, @best_move)
  end

  private

  def score(board, depth)
    return 10 - depth if board.game_over? == marker
    return depth - 10 if board.game_over? == opponent_marker
    return 0 if board.game_over? == "tie"
  end

  def best_move(scores, moves, computers_turn)
    if computers_turn
      best_mv_index = scores.each_with_index.max[1]
      @best_move = moves[best_mv_index]
      return scores[best_mv_index]
    else
      worst_mv_index = scores.each_with_index.min[1]
      return scores[worst_mv_index]
    end
  end
end


