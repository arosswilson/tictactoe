require "pry"
class Board
  attr_accessor :board
  def initialize(args={})
    @board_size = args[:board_size] || 3
    @board = Array.new(@board_size){Array.new(@board_size,'_')}
  end

  def possible_moves
    moves = []
    @board.each.with_index do |row, c_num|
      row.each.with_index{|space, r_num|
        moves << "#{c_num.to_s},#{r_num.to_s}" if space =='_'}
    end
    moves
  end

  def move(marker, position)
    pos = position.split(',')
    return nil if board[pos[0]][pos[1]] !='_'
    board[pos[0]][pos[1]] = marker
  end

  def to_s
    display = " " +('0'...(board_size.to_s).to_a.join(' ') + "\n"
    board.each.with_index do |row, i|
      display += (i+1).to_s + row.join("|")+ "\n"
    end
    puts display
  end

  def row_check(gameboard)
    gameboard.each do |row|
      return row[0] if row.uniq.length == 1 && !(row.include?('_'))
    end
  end

  def diag_check(gameboard)
    diag_one = (0...board_size).collect{|i| board[i][i]}
    diag_two = (1..board_size).collect{|i| board[-i][(i-1)]}
    return diag_one[0] if diag_one.uniq.length == 1 && !(diag_one.include?('_'))
    return diag_two[0] if diag_two.uniq.length == 1 && !(diag_two.include?('_'))
  end



end

b = Board.new({board_size: 3})
puts b.possible_moves
b.to_s
puts b.possible_moves

