require_relative '../lib/board'
require_relative '../lib/computer'
require_relative '../lib/player'
describe Board do
  let(:winner) {winner = Board.new({board_size: 3, board: [["X","_","O"],["O","X","_"],["_","O","X"]]})}
  let(:test_board) {test_board = Board.new}
  let(:player) {player = Player.new({marker: "X", name: "Ross"})}
  let(:computer) {computer = Computer.new({marker: "O"})}

  it "updates the board with the move method" do
    test_board.move("X","1,1")
    expect(test_board.board[1][1]).to eq("X")
  end

  it "finds winning boards" do
    expect(winner.game_over?).to be_truthy
  end

  it "reports the winner" do
    expect(winner.find_winner(player, computer)).to eq("Winner: Ross")
  end
end