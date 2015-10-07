require_relative 'board.rb'
require "pry"
class Computer
  attr_accessor :best_move
  attr_reader :marker, :opponent_marker
  def initialize(args={})
    @marker = args[:marker] || "O"
    @opponent_marker = args[:opponent_marker] || "X"
    @best_move
  end

  def score(board, depth)
    return 10 - depth if board.game_over? == "O"
    return depth - 10 if board.game_over? == "X"
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

  def minimax(board, computers_turn, depth = 0)
    return score(board, depth) if board.game_over?
    scores = []
    moves =[]
    board.possible_moves.each do |move|
      board.move(marker, move) if computers_turn
      board.move(opponent_marker, move) if !computers_turn
      if computers_turn
        scores << minimax(board, false, depth+1)
      elsif !computers_turn
        scores << minimax(board, true, depth+1)
      end
      moves << move
      board.undo(move)
    end
    best_move(scores, moves, computers_turn)
  end

  def move(board)
    minimax(board,true)
    binding.pry
    board.move(marker, @best_move)
  end
end

b = Board.new({board_size: 3, board: [["X","X","O"],["_","O","_"],["X","O","_"]]})
c = Computer.new
p c.move(b)
p b.board
