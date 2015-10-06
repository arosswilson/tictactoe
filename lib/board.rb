class Board
  attr_accessor :board
  def initialize(args={})
    @board_size = args[:board_size] || 3
    @board = Array.new(@board_size){Array.new(@board_size,'_')}
  end

  def possible_moves
    moves = []
    @board.each.with_index do |row, c_num|
      row.each.with_index{|space, r_num| moves << "#{c_num.to_s},#{r_num.to_s}" if space =='_'}
    end
    moves
  end

  def to_s
    counter = 1
    display = (1..@board_size)
    display = board.map do |row|
      row.unshift(counter.to_s).join("|")+ "\n"
      counter += 1
    end
    puts display.join('')
  end


end

b = Board.new({board_size: 3})
b.to_s
